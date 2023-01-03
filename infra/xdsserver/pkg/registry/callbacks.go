package registry

import (
	"context"

	discovery "github.com/envoyproxy/go-control-plane/envoy/service/discovery/v3"
	xds "github.com/envoyproxy/go-control-plane/pkg/server/v3"
	log "github.com/sirupsen/logrus"
)

type callbacks struct {
	cbs []xds.Callbacks
}

func (cb *callbacks) OnStreamOpen(ctx context.Context, id int64, typ string) error {
	log.Infof("OnStreamOpen %d open for Type [%s]", id, typ)
	for _, cb := range cb.cbs {
		if err := cb.OnStreamOpen(ctx, id, typ); err != nil {
			return err
		}
	}
	return nil
}

func (cb *callbacks) OnStreamClosed(id int64) {
	log.Infof("OnStreamClosed %d closed", id)
	for _, cb := range cb.cbs {
		cb.OnStreamClosed(id)
	}
}

func (cb *callbacks) OnStreamRequest(id int64, r *discovery.DiscoveryRequest) error {
	log.Infof("OnStreamRequest %d  Request[%v] %v from %s", id, r.TypeUrl, r.ResourceNames, r.GetNode().GetId())
	for _, cb := range cb.cbs {
		if err := cb.OnStreamRequest(id, r); err != nil {
			return err
		}
	}
	return nil
}

func (cb *callbacks) OnStreamResponse(ctx context.Context, id int64, req *discovery.DiscoveryRequest, resp *discovery.DiscoveryResponse) {
	for _, cb := range cb.cbs {
		cb.OnStreamResponse(ctx, id, req, resp)
	}
	log.Infof("OnStreamResponse %d   Request [%v],  Response[%v] with %d elements on version %s", id, req.TypeUrl, resp.TypeUrl, len(resp.Resources), resp.VersionInfo)
}

func (cb *callbacks) OnFetchRequest(ctx context.Context, req *discovery.DiscoveryRequest) error {
	log.Infof("OnFetchRequest... Request [%v]", req.TypeUrl)
	for _, cb := range cb.cbs {
		if err := cb.OnFetchRequest(ctx, req); err != nil {
			return err
		}
	}
	return nil
}

func (cb *callbacks) OnFetchResponse(req *discovery.DiscoveryRequest, resp *discovery.DiscoveryResponse) {
	log.Infof("OnFetchResponse... Resquest[%v],  Response[%v]", req.GetTypeUrl(), resp.GetTypeUrl())
	for _, cb := range cb.cbs {
		cb.OnFetchResponse(req, resp)
	}
}

func (cb *callbacks) OnDeltaStreamClosed(id int64) {
	log.Infof("OnDeltaStreamClosed... %v", id)
	for _, cb := range cb.cbs {
		cb.OnDeltaStreamClosed(id)
	}
}

func (cb *callbacks) OnDeltaStreamOpen(ctx context.Context, id int64, typ string) error {
	log.Infof("OnDeltaStreamOpen... %v  of type %s", id, typ)
	for _, cb := range cb.cbs {
		if err := cb.OnDeltaStreamOpen(ctx, id, typ); err != nil {
			return err
		}
	}
	return nil
}

func (cb *callbacks) OnStreamDeltaRequest(i int64, request *discovery.DeltaDiscoveryRequest) error {
	log.Infof("OnStreamDeltaRequest... %v  of type %s", i, request)
	return nil
}

func (cb *callbacks) OnStreamDeltaResponse(id int64, req *discovery.DeltaDiscoveryRequest, resp *discovery.DeltaDiscoveryResponse) {
	log.Infof("OnStreamDeltaResponse... %v  of type %s", id, req.GetTypeUrl())
	for _, cb := range cb.cbs {
		cb.OnStreamDeltaResponse(id, req, resp)
	}
}
