package hash

import (
	core "github.com/envoyproxy/go-control-plane/envoy/config/core/v3"
)

// IDHash uses ID field as the node hash.
type StaticHash struct{}

// ID uses the node ID field
func (StaticHash) ID(node *core.Node) string {
	return "default"
}
