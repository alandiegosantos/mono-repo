package datasource

import (
	"context"
	"net"
	"sync"

	cluster "github.com/envoyproxy/go-control-plane/envoy/config/cluster/v3"
	core "github.com/envoyproxy/go-control-plane/envoy/config/core/v3"
	listener "github.com/envoyproxy/go-control-plane/envoy/config/listener/v3"
	route "github.com/envoyproxy/go-control-plane/envoy/config/route/v3"
	router "github.com/envoyproxy/go-control-plane/envoy/extensions/filters/http/router/v3"
	hcm "github.com/envoyproxy/go-control-plane/envoy/extensions/filters/network/http_connection_manager/v3"
	discovery "github.com/envoyproxy/go-control-plane/envoy/service/discovery/v3"
	"github.com/envoyproxy/go-control-plane/pkg/cache/types"
	resource "github.com/envoyproxy/go-control-plane/pkg/resource/v3"
	xds "github.com/envoyproxy/go-control-plane/pkg/server/v3"
	"github.com/envoyproxy/go-control-plane/pkg/wellknown"
	"github.com/pkg/errors"
	log "github.com/sirupsen/logrus"
	"google.golang.org/protobuf/types/known/anypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

var _ DataSource = &staticDataSource{}

type staticDataSource struct {
	registeredEndpoints sync.Map // streamID -> core.Node
	mutex               sync.RWMutex
	cb                  Callback
}

func NewStaticDataSource() DataSource {
	return &staticDataSource{}
}

func (s *staticDataSource) GetConfiguration() ([]types.Resource, []types.Resource, []types.Resource, []types.Resource, error) {
	endpointEntries := make([]*endpointEntry, 0)

	s.registeredEndpoints.Range(func(_, value any) bool {
		if entry, ok := value.(*endpointEntry); ok {
			endpointEntries = append(endpointEntries, entry)
		}
		return true
	})

	eps := convertEntriesToLoadAssignment(endpointEntries)

	listeners := make([]types.Resource, 0)
	clusters := make([]types.Resource, 0)
	routeConfigurations := make([]types.Resource, 0)
	clusterLoadAssignments := make([]types.Resource, 0)

	for _, la := range eps {
		cluster := la.GetClusterName()

		if l, err := s.generateStaticListener(cluster); err != nil {
			return nil, nil, nil, nil, err
		} else {
			listeners = append(listeners, l)
		}
		clusters = append(clusters, s.generateStaticCluster(cluster))
		routeConfigurations = append(routeConfigurations, s.generateStaticRoute(cluster))
		clusterLoadAssignments = append(clusterLoadAssignments, la)
	}

	return listeners, clusters, routeConfigurations, clusterLoadAssignments, nil
}

func (s *staticDataSource) GetStreamCallbacks() (xds.Callbacks, error) {
	return xds.CallbackFuncs{
		StreamRequestFunc:  s.onStreamRequest,
		StreamResponseFunc: s.onStreamResponse,
		StreamClosedFunc:   s.onStreamClose,
	}, nil
}

func (s *staticDataSource) SetCallback(cb Callback) {
	s.cb = cb

	// Call the callback to initialize an empty configuration
	cb()
}

func (s *staticDataSource) onStreamResponse(ctx context.Context, id int64, req *discovery.DiscoveryRequest, resp *discovery.DiscoveryResponse) {
	if req.GetTypeUrl() == resource.ListenerType {
		for _, listenerName := range req.ResourceNames {
			if tcpAddr, err := net.ResolveTCPAddr("tcp", listenerName); err == nil {
				listener, err := s.getIngressListener(listenerName, tcpAddr.IP, uint32(tcpAddr.Port))
				if err != nil {
					log.WithError(err).Error("Failed to generate ingress listener")
				} else {
					resp.Resources = append(resp.Resources, listener)
				}
				break
			}
		}
	}

	if req.GetTypeUrl() == resource.EndpointType {
		log.WithField("resources", resp.Resources).Info("Returning endpoints")
	}
}

func (s *staticDataSource) onStreamRequest(streamID int64, req *discovery.DiscoveryRequest) error {
	if len(req.VersionInfo) > 0 && req.GetTypeUrl() == resource.ListenerType {
		// Means that the server has accepted the configuration
		for _, listenerName := range req.ResourceNames {
			if tcpAddr, err := net.ResolveTCPAddr("tcp", listenerName); err == nil {
				if err := s.registerEndpoint(streamID, req.GetNode(), uint32(tcpAddr.Port)); err != nil {
					return err
				}
			}
		}
	}
	return nil
}

func (s *staticDataSource) onStreamClose(streamID int64) {
	s.deregisterEndpoint(streamID)
}

func (s *staticDataSource) generateStaticCluster(svc string) *cluster.Cluster {
	return &cluster.Cluster{
		Name:                 svc,
		LbPolicy:             cluster.Cluster_ROUND_ROBIN,
		ClusterDiscoveryType: &cluster.Cluster_Type{Type: cluster.Cluster_EDS},
		EdsClusterConfig: &cluster.Cluster_EdsClusterConfig{
			EdsConfig: &core.ConfigSource{
				ConfigSourceSpecifier: &core.ConfigSource_Ads{},
			},
		},
	}
}

func (s *staticDataSource) generateStaticRoute(svc string) *route.RouteConfiguration {
	return &route.RouteConfiguration{
		Name:             svc + ".route",
		ValidateClusters: &wrapperspb.BoolValue{Value: true},
		VirtualHosts: []*route.VirtualHost{
			{
				Name:    svc + ".vhost",
				Domains: []string{svc},
				Routes: []*route.Route{
					{
						Match: &route.RouteMatch{
							PathSpecifier: &route.RouteMatch_Prefix{
								Prefix: "",
							},
						},
						Action: &route.Route_Route{
							Route: &route.RouteAction{
								ClusterSpecifier: &route.RouteAction_Cluster{
									Cluster: svc,
								},
							},
						},
					},
				},
			},
		},
	}
}

func (s *staticDataSource) generateStaticListener(svc string) (*listener.Listener, error) {
	hcm, err := s.getHttpConnectionManager(svc)
	if err != nil {
		return nil, err
	}
	return &listener.Listener{
		Name: svc,
		ApiListener: &listener.ApiListener{
			ApiListener: hcm,
		},
	}, nil
}

func (s *staticDataSource) getHttpConnectionManager(name string) (*anypb.Any, error) {
	hff := &router.Router{}
	tctx, err := anypb.New(hff)
	if err != nil {
		return nil, errors.Wrap(err, "Could not serialize router filter")
	}

	manager := &hcm.HttpConnectionManager{
		CodecType: hcm.HttpConnectionManager_AUTO,
		RouteSpecifier: &hcm.HttpConnectionManager_Rds{
			Rds: &hcm.Rds{
				RouteConfigName: name + ".route",
				ConfigSource: &core.ConfigSource{
					ResourceApiVersion: core.ApiVersion_V3,
					ConfigSourceSpecifier: &core.ConfigSource_Ads{
						Ads: &core.AggregatedConfigSource{},
					},
				},
			},
		},
		HttpFilters: []*hcm.HttpFilter{{
			Name: wellknown.Router,
			ConfigType: &hcm.HttpFilter_TypedConfig{
				TypedConfig: tctx,
			},
		}},
	}

	return anypb.New(manager)
}

func (s *staticDataSource) getIngressListener(name string, ipAddress net.IP, port uint32) (*anypb.Any, error) {
	hff := &router.Router{}
	tctx, err := anypb.New(hff)
	if err != nil {
		return nil, errors.Wrap(err, "could not serialize router filter")
	}

	manager := &hcm.HttpConnectionManager{
		CodecType: hcm.HttpConnectionManager_AUTO,
		RouteSpecifier: &hcm.HttpConnectionManager_RouteConfig{
			RouteConfig: &route.RouteConfiguration{
				Name: "ingress.route",
				VirtualHosts: []*route.VirtualHost{
					{
						Name:    "ingress.vhost",
						Domains: []string{"*"},
						Routes: []*route.Route{
							{
								Match: &route.RouteMatch{
									PathSpecifier: &route.RouteMatch_Prefix{
										Prefix: "",
									},
								},
								Action: &route.Route_NonForwardingAction{
									NonForwardingAction: &route.NonForwardingAction{},
								},
							},
						},
					},
				},
			},
		},
		HttpFilters: []*hcm.HttpFilter{
			{
				Name: wellknown.Router,
				ConfigType: &hcm.HttpFilter_TypedConfig{
					TypedConfig: tctx,
				},
			},
		},
	}

	typedConfig, err := anypb.New(manager)
	if err != nil {
		return nil, errors.Wrap(err, "could not serialize connection manager")
	}

	l := &listener.Listener{
		Name: name,
		Address: &core.Address{
			Address: &core.Address_SocketAddress{
				SocketAddress: &core.SocketAddress{
					Address: ipAddress.String(),
					PortSpecifier: &core.SocketAddress_PortValue{
						PortValue: port,
					},
				},
			},
		},
		FilterChains: []*listener.FilterChain{
			{
				Filters: []*listener.Filter{
					{
						Name: wellknown.HTTPConnectionManager,
						ConfigType: &listener.Filter_TypedConfig{
							TypedConfig: typedConfig,
						},
					},
				},
			},
		},
	}

	return anypb.New(l)
}

func (s *staticDataSource) registerEndpoint(streamID int64, node *core.Node, port uint32) error {
	if _, ok := s.registeredEndpoints.Load(streamID); ok {
		return nil
	}

	log.WithFields(
		log.Fields{"node": node.GetId(), "ingressPort": port}).
		Infof("Registering node")

	ipAddr := ""
	if v, found := node.GetMetadata().GetFields()["IP_ADDRESS"]; found {
		ipAddr = v.GetStringValue()
	}
	if len(ipAddr) == 0 {
		// Do not register if the IP_ADDRESS is not included in the metadata
		return nil
	}

	entry := &endpointEntry{
		node:        node,
		ingressPort: port,
	}

	s.registeredEndpoints.Store(streamID, entry)

	if s.cb != nil {
		s.cb()
	}

	return nil
}

func (s *staticDataSource) deregisterEndpoint(streamID int64) {
	s.registeredEndpoints.Delete(streamID)

	if s.cb != nil {
		s.cb()
	}
}
