//go:build darwin
// +build darwin

package net

import (
	"context"
	"net"
	"time"
)

const defaultKeepAlive = 10 * time.Second

func Listen(ctx context.Context, network, address string) (net.Listener, error) {
	config := &net.ListenConfig{
		KeepAlive: defaultKeepAlive,
		Control:   nil,
	}
	return config.Listen(ctx, network, address)
}
