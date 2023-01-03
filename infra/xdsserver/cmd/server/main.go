package main

import (
	"context"
	"flag"
	"fmt"
	"os"
	"time"

	cluster "github.com/envoyproxy/go-control-plane/envoy/service/cluster/v3"
	discovery "github.com/envoyproxy/go-control-plane/envoy/service/discovery/v3"
	endpoint "github.com/envoyproxy/go-control-plane/envoy/service/endpoint/v3"
	route "github.com/envoyproxy/go-control-plane/envoy/service/route/v3"
	cache "github.com/envoyproxy/go-control-plane/pkg/cache/v3"
	xds "github.com/envoyproxy/go-control-plane/pkg/server/v3"
	log "github.com/sirupsen/logrus"
	"go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc"
	"golang.org/x/sync/errgroup"
	"google.golang.org/grpc"
	"google.golang.org/grpc/health"
	healthgrpc "google.golang.org/grpc/health/grpc_health_v1"

	"github.com/alandiegosantos/monorepo/common/go/goinit"
	"github.com/alandiegosantos/monorepo/common/go/net"
	"github.com/alandiegosantos/monorepo/infra/xdsserver/pkg/registry"
	"github.com/alandiegosantos/monorepo/infra/xdsserver/pkg/registry/datasource"
	"github.com/alandiegosantos/monorepo/infra/xdsserver/pkg/xds/hash"
)

func main() {
	serverPort := flag.Int("port", 50050, "The server port")
	flag.Parse()

	ctx, cancel := context.WithCancel(context.Background())

	sigs := goinit.InitGrpcServer()

	snapshotCache := cache.NewSnapshotCache(false, hash.StaticHash{}, log.WithField("module", "cache"))

	reg := registry.NewRegistry(
		registry.WithSnapshotCache(snapshotCache),
		registry.WithDataSource(datasource.NewStaticDataSource()),
	)

	cbs, err := reg.GetCallbacks()
	if err != nil {
		panic(err)
	}

	server := xds.NewServer(ctx, reg.GetCache(), cbs)
	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(otelgrpc.UnaryServerInterceptor()),
		grpc.StreamInterceptor(otelgrpc.StreamServerInterceptor()),
	)

	healthcheck := health.NewServer()
	healthgrpc.RegisterHealthServer(grpcServer, healthcheck)

	g, ctx := errgroup.WithContext(ctx)

	g.Go(func() error {
		return reg.Run(ctx)
	})

	g.Go(func() error {
		lis, err := net.Listen(ctx, "tcp", fmt.Sprintf("0.0.0.0:%d", *serverPort))
		if err != nil {
			log.WithError(err).Fatalf("Cannot listen on %d", *serverPort)
		}

		discovery.RegisterAggregatedDiscoveryServiceServer(grpcServer, server)
		endpoint.RegisterEndpointDiscoveryServiceServer(grpcServer, server)
		cluster.RegisterClusterDiscoveryServiceServer(grpcServer, server)
		route.RegisterRouteDiscoveryServiceServer(grpcServer, server)

		log.Printf("GRPC server listening on :%d...", *serverPort)
		return grpcServer.Serve(lis)
	})

	g.Go(func() error {
		ticker := time.NewTicker(10 * time.Second)

		defer healthcheck.SetServingStatus("", healthgrpc.HealthCheckResponse_NOT_SERVING)

		for {
			select {
			case <-ctx.Done():
				return nil
			case <-ticker.C:
				if reg.IsHealthy() {
					healthcheck.SetServingStatus("", healthgrpc.HealthCheckResponse_SERVING)
				} else {
					healthcheck.SetServingStatus("", healthgrpc.HealthCheckResponse_NOT_SERVING)
				}
			}
		}
	})

	select {
	case <-ctx.Done():
	case <-sigs:
		break
	}

	cancel()

	// TODO: grpc server stop is hanging

	os.Exit(0)

	if err := g.Wait(); err != nil {
		log.WithError(err).Error("Routines ended with error")
	}
}
