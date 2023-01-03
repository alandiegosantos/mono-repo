package main

import (
	"fmt"

	_ "cloud.google.com/go/compute/metadata"
	_ "github.com/bazelbuild/rules_docker/container/go/pkg/utils"
	_ "github.com/cncf/xds/go/udpa/type/v1"
	_ "github.com/envoyproxy/go-control-plane/envoy/config/cluster/v3"
	_ "github.com/envoyproxy/go-control-plane/envoy/config/core/v3"
	_ "github.com/envoyproxy/go-control-plane/envoy/config/endpoint/v3"
	_ "github.com/envoyproxy/go-control-plane/envoy/config/listener/v3"
	_ "github.com/envoyproxy/go-control-plane/envoy/service/cluster/v3"
	_ "github.com/envoyproxy/go-control-plane/envoy/service/discovery/v3"
	_ "github.com/envoyproxy/go-control-plane/envoy/service/endpoint/v3"
	_ "github.com/envoyproxy/go-control-plane/envoy/service/route/v3"
	_ "github.com/envoyproxy/go-control-plane/pkg/cache/types"
	_ "github.com/envoyproxy/go-control-plane/pkg/cache/v3"
	_ "github.com/envoyproxy/go-control-plane/pkg/resource/v3"
	_ "github.com/envoyproxy/go-control-plane/pkg/server/v3"
	_ "github.com/google/go-containerregistry/pkg/authn"
	_ "github.com/google/go-containerregistry/pkg/name"
	_ "github.com/google/go-containerregistry/pkg/v1/remote"
	_ "github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	_ "github.com/pkg/errors"
	_ "github.com/prometheus/client_golang/prometheus/promhttp"
	_ "github.com/sirupsen/logrus"
	_ "go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc"
	_ "golang.org/x/sync/errgroup"
	_ "google.golang.org/genproto/googleapis/api/annotations"
	_ "google.golang.org/grpc"
	_ "google.golang.org/grpc/grpclog/glogger"
	_ "google.golang.org/grpc/xds"
	_ "k8s.io/api/apps/v1"
	_ "k8s.io/api/autoscaling/v2"
	_ "k8s.io/api/core/v1"
	_ "k8s.io/client-go/kubernetes/scheme"
	_ "kernel.org/pub/linux/libs/security/libcap/cap"
)

func main() {
	fmt.Printf("Do Nothing")
}
