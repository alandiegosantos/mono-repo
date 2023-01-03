package registry

import (
	"context"
	"sync"
	"time"

	"github.com/envoyproxy/go-control-plane/pkg/cache/types"
	cache "github.com/envoyproxy/go-control-plane/pkg/cache/v3"
	resource "github.com/envoyproxy/go-control-plane/pkg/resource/v3"
	xds "github.com/envoyproxy/go-control-plane/pkg/server/v3"
	"github.com/pkg/errors"
	log "github.com/sirupsen/logrus"

	"github.com/alandiegosantos/monorepo/infra/xdsserver/pkg/registry/datasource"
)

const debouncePeriod = 100 * time.Millisecond

type registry struct {
	configurationCache       cache.SnapshotCache
	configurationDataSources []datasource.DataSource

	mutex sync.RWMutex
}

type Option func(*registry)

func WithSnapshotCache(cache cache.SnapshotCache) Option {
	return func(e *registry) {
		e.configurationCache = cache
	}
}

func WithDataSource(ds datasource.DataSource) Option {
	return func(e *registry) {
		e.configurationDataSources = append(e.configurationDataSources, ds)
	}
}

func NewRegistry(opts ...Option) *registry {
	em := &registry{}

	for _, opt := range opts {
		opt(em)
	}

	return em
}

func (e *registry) Run(ctx context.Context) error {
	pushConfiguration := make(chan struct{}, 20)

	cb := func() {
		select {
		case pushConfiguration <- struct{}{}:
		default:
			log.Warn("pushConfiguration channel is full")
		}
	}

	for _, ds := range e.configurationDataSources {
		ds.SetCallback(cb)
	}

	var timeChan <-chan time.Time

	for ctx.Err() == nil {

		log.Info("Starting loop")

		select {
		case <-pushConfiguration:
			timeChan = time.After(debouncePeriod)
		case <-timeChan:
			e.UpdateConfiguration()
			// TODO: debounce code
		}
	}

	return nil
}

func (e *registry) GetCallbacks() (xds.Callbacks, error) {
	cbs := make([]xds.Callbacks, 0, len(e.configurationDataSources))

	for _, ds := range e.configurationDataSources {

		cb, err := ds.GetStreamCallbacks()
		if err != nil {
			return nil, errors.Wrap(err, "Failed to return callbacks for datasource")
		}
		cbs = append(cbs, cb)
	}

	return &callbacks{cbs: cbs}, nil
}

func (e *registry) UpdateConfiguration() {
	e.mutex.Lock()
	defer e.mutex.Unlock()

	listeners := make([]types.Resource, 0)
	routes := make([]types.Resource, 0)
	clusters := make([]types.Resource, 0)
	endpoints := make([]types.Resource, 0)

	for _, ds := range e.configurationDataSources {
		l, c, rc, eps, err := ds.GetConfiguration()
		if err != nil {
			log.WithError(err).WithField("datasource", ds).Error("could not fetch configuration from datasource")
			return
		}
		listeners = append(listeners, l...)
		clusters = append(clusters, c...)
		routes = append(routes, rc...)
		endpoints = append(endpoints, eps...)
	}

	resources := make(map[resource.Type][]types.Resource, 4)
	resources[resource.ClusterType] = clusters
	resources[resource.EndpointType] = endpoints
	resources[resource.RouteType] = routes
	resources[resource.ListenerType] = listeners

	// TODO: Validate the snapshot if there is no overlap
	// across datasources

	snapshot, err := cache.NewSnapshot(time.Now().String(), resources)
	if err != nil {
		log.WithError(err).Error("could not generate snapshot")
	}

	if err := e.configurationCache.SetSnapshot(context.TODO(), "default", snapshot); err != nil {
		log.WithError(err).Error("could not set Snapshot")
	}
	log.WithField("snapshot", snapshot.GetVersion(resource.ListenerType)).Info("snapshot updated")
}

func (e *registry) GetCache() cache.SnapshotCache {
	return e.configurationCache
}

func (e *registry) IsHealthy() bool {
	// Always return true for now
	return true
}
