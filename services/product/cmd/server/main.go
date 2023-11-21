package main

import (
	"context"
	"flag"
	"fmt"
	"net"
	"net/http"
	"os"

	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	log "github.com/sirupsen/logrus"
	"golang.org/x/sync/errgroup"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	xdscreds "google.golang.org/grpc/credentials/xds"
	"google.golang.org/grpc/xds"

	_ "google.golang.org/grpc/grpclog/glogger"

	"github.com/alandiegosantos/monorepo/common/go/goinit"
	products "github.com/alandiegosantos/monorepo/proto/product"
	"github.com/alandiegosantos/monorepo/services/product/pkg/handler"
)

func init() {
	goinit.InitGrpc()
}

func main() {
	serverPort := flag.Int("port", 50051, "The server port")
	httpPort := flag.Int("http-port", 8080, "The port to receive http traffic")
	flag.Parse()

	ctx, cancel := context.WithCancel(context.Background())
	sigs := goinit.InitGrpcServer()

	g, ctx := errgroup.WithContext(ctx)

	productsHandler, err := handler.NewProductsServiceHandler()
	if err != nil {
		log.WithError(err).Fatal("Cannot start products handler")
	}

	g.Go(func() error {
		lis, err := net.Listen("tcp", fmt.Sprintf("0.0.0.0:%d", *serverPort))
		if err != nil {
			log.Fatalf("failed to listen: %v", err)
		}
		creds, err := xdscreds.NewServerCredentials(xdscreds.ServerOptions{FallbackCreds: insecure.NewCredentials()})
		if err != nil {
			return err
		}
		grpcServer := xds.NewGRPCServer(grpc.Creds(creds))
		products.RegisterProductServiceServer(grpcServer, productsHandler)
		log.Infof("GRPC server listening on :%d...", *serverPort)
		return grpcServer.Serve(lis)
	})

	g.Go(func() error {
		mux := runtime.NewServeMux()

		products.RegisterProductServiceHandlerServer(ctx, mux, productsHandler)

		s := &http.Server{
			Addr:    fmt.Sprintf("0.0.0.0:%d", *httpPort),
			Handler: mux,
		}

		log.Infof("HTTP server listening on :%d...", *httpPort)

		if err := s.ListenAndServe(); err != http.ErrServerClosed {
			return err
		}

		return nil
	})

	select {
	case <-ctx.Done():
	case <-sigs:
	}

	cancel()

	os.Exit(0)

	if err := g.Wait(); err != nil {
		log.WithError(err).Error("Routines ended with error")
	}
}
