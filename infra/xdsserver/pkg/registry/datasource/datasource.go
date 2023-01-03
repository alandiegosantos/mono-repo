package datasource

import (
	core "github.com/envoyproxy/go-control-plane/envoy/config/core/v3"
	"github.com/envoyproxy/go-control-plane/pkg/cache/types"
	xds "github.com/envoyproxy/go-control-plane/pkg/server/v3"
)

type DataSource interface {
	GetConfiguration() ([]types.Resource, []types.Resource, []types.Resource, []types.Resource, error)
	GetStreamCallbacks() (xds.Callbacks, error)
	SetCallback(cb Callback)
}

type Callback func()

type endpointEntry struct {
	node        *core.Node
	ingressPort uint32
}
