package datasource

import (
	core "github.com/envoyproxy/go-control-plane/envoy/config/core/v3"
	endpoint "github.com/envoyproxy/go-control-plane/envoy/config/endpoint/v3"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

func convertEntriesToLoadAssignment(endpointEntries []*endpointEntry) []*endpoint.ClusterLoadAssignment {
	endpointsPerCluster := make(map[string][]*endpointEntry)

	for _, entry := range endpointEntries {
		cluster := entry.node.GetCluster()
		endpointsPerCluster[cluster] = append(endpointsPerCluster[cluster], entry)
	}

	loadAssignments := make([]*endpoint.ClusterLoadAssignment, 0)

	for cl, entries := range endpointsPerCluster {
		la := &endpoint.ClusterLoadAssignment{
			ClusterName: cl,
			Endpoints:   []*endpoint.LocalityLbEndpoints{},
		}

		localityLbEndpoints := make(map[*core.Locality]*endpoint.LocalityLbEndpoints)

		for _, entry := range entries {
			if localityLbEndpoint, found := localityLbEndpoints[entry.node.GetLocality()]; found {
				localityLbEndpoint.LbEndpoints = append(
					localityLbEndpoint.LbEndpoints,
					entryToEndpoint(entry.node, entry.ingressPort),
				)
			} else {
				lbLocalityEndpoints := &endpoint.LocalityLbEndpoints{
					Locality:            entry.node.GetLocality(),
					Priority:            0,
					LoadBalancingWeight: &wrapperspb.UInt32Value{Value: uint32(1000)},
					LbEndpoints: []*endpoint.LbEndpoint{
						entryToEndpoint(entry.node, entry.ingressPort),
					},
				}

				// Pointers coming to the rescue
				localityLbEndpoints[entry.node.GetLocality()] = lbLocalityEndpoints
				la.Endpoints = append(la.Endpoints, lbLocalityEndpoints)

			}
		}

		loadAssignments = append(loadAssignments, la)
	}

	return loadAssignments
}

func entryToEndpoint(node *core.Node, ingressPort uint32) *endpoint.LbEndpoint {
	ipAddr := ""
	if v, found := node.GetMetadata().GetFields()["IP_ADDRESS"]; found {
		ipAddr = v.GetStringValue()
	}
	if len(ipAddr) == 0 {
		// Do not register if the IP_ADDRESS is not included in the metadata
		ipAddr = "127.0.0.1"
	}

	return &endpoint.LbEndpoint{
		LoadBalancingWeight: &wrapperspb.UInt32Value{Value: uint32(1000)},
		HostIdentifier: &endpoint.LbEndpoint_Endpoint{
			Endpoint: &endpoint.Endpoint{
				Hostname: node.GetId(),
				Address: &core.Address{
					Address: &core.Address_SocketAddress{
						SocketAddress: &core.SocketAddress{
							Address:  ipAddr,
							Protocol: core.SocketAddress_TCP,
							PortSpecifier: &core.SocketAddress_PortValue{
								PortValue: ingressPort,
							},
						},
					},
				},
			},
		},
		HealthStatus: core.HealthStatus_HEALTHY,
	}
}
