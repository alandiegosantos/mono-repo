package main

import (
	"fmt"
	"io/ioutil"
	"os"

	core "github.com/envoyproxy/go-control-plane/envoy/config/core/v3"
	log "github.com/sirupsen/logrus"
	"google.golang.org/protobuf/encoding/protojson"
	"google.golang.org/protobuf/types/known/structpb"

	"github.com/alandiegosantos/monorepo/common/go/net"
	"github.com/alandiegosantos/monorepo/proto/infra"
)

func main() {
	xdsServer := GetEnvOrDefault("XDS_SERVER", "localhost:50051")
	hostname := GetEnvOrDefault("HOSTNAME", "node-1")
	cluster := GetEnvOrDefault("CLUSTER", "service-1")
	region := GetEnvOrDefault("REGION", "region-1")
	zone := GetEnvOrDefault("ZONE", "zone-1")
	subzone := GetEnvOrDefault("SUBZONE", "subzone-1")
	grpcXdsBootstrap := GetEnvOrDefault("GRPC_XDS_BOOTSTRAP", "")

	var ipAddr string = ""
	if ip, err := net.GetInboundIP(); err != nil {
		panic(err)
	} else {
		ipAddr = ip.To4().String()
	}

	bootstrapContent := &infra.Bootstrap{
		Node: &core.Node{
			Id:      hostname,
			Cluster: cluster,
			Locality: &core.Locality{
				Region:  region,
				Zone:    zone,
				SubZone: subzone,
			},
			Metadata: &structpb.Struct{
				Fields: map[string]*structpb.Value{
					"IP_ADDRESS": {Kind: &structpb.Value_StringValue{StringValue: ipAddr}},
				},
			},
		},
		ServerListenerResourceNameTemplate: "%s",
		XDSServers: []*infra.XDSServer{
			{
				ServerUri: xdsServer,
				ServerFeatures: []infra.XDSServer_ServerFeature{
					infra.XDSServer_xds_v3,
				},
				ChannelCreds: []*infra.ChannelCredential{
					{
						Type: infra.ChannelCredential_insecure,
					},
				},
			},
		},
	}

	data, err := protojson.Marshal(bootstrapContent)
	if err != nil {
		log.WithError(err).Fatal("could not serialize bootstrap file")
	}

	if len(grpcXdsBootstrap) > 0 {
		if err := ioutil.WriteFile(grpcXdsBootstrap, data, 0644); err != nil {
			log.WithError(err).Fatal("could not write bootstrap file")
		}
	}

	fmt.Printf("%v\n", string(data))
}

func GetEnvOrDefault(env, defaultValue string) string {
	v := os.Getenv(env)
	if len(v) == 0 {
		return defaultValue
	}
	return v
}
