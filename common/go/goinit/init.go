package goinit

import (
	"fmt"
	"net/http"
	"os"

	"github.com/prometheus/client_golang/prometheus/promhttp"
	log "github.com/sirupsen/logrus"
	"google.golang.org/grpc/balancer"
	"google.golang.org/grpc/balancer/roundrobin"
	"google.golang.org/grpc/resolver"
	_ "google.golang.org/grpc/resolver"
	_ "google.golang.org/grpc/xds"
)

const DefaultPrometheusPort = 15001

func init() {
	ensureNotEUID()
}

func InitGrpc() {
	resolver.SetDefaultScheme("dns")
	// Just to force the import of library
	balancer.Register(balancer.Get(roundrobin.Name))

	// InitPrometheus()
}

func InitGrpcServer() <-chan os.Signal {
	InitGrpc()

	sigs := make(chan os.Signal, 100)
	// signal.Notify(sigs, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

	return sigs
}

func InitPrometheus() {
	mux := http.NewServeMux()

	mux.Handle("/metrics", promhttp.Handler())

	s := &http.Server{
		Addr:    fmt.Sprintf("0.0.0.0:%d", DefaultPrometheusPort),
		Handler: mux,
	}

	go func() {
		if err := s.ListenAndServe(); err != http.ErrServerClosed {
			log.WithError(err).Error("Cannot start http server for Prometheus")
		}
	}()
}
