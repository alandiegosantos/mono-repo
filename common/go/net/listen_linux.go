//go:build linux
// +build linux

package net

import (
	"context"
	"fmt"
	"time"

	gonet "net"

	"kernel.org/pub/linux/libs/security/libcap/cap"
)

const defaultKeepAlive = 10 * time.Second

func Listen(ctx context.Context, network, address string) (gonet.Listener, error) {
	orig := cap.GetProc()
	defer orig.SetProc() // restore original caps on exit.

	_, err := orig.Dup()
	if err != nil {
		return nil, fmt.Errorf("failed to dup caps: %v", err)
	}

	// if on, _ := c.GetFlag(cap.Permitted, cap.NET_BIND_SERVICE); !on {
	// 	return nil, fmt.Errorf("insufficient privilege to bind to low ports - want %q, have %q", cap.NET_BIND_SERVICE, c)
	// }

	// if err := c.SetFlag(cap.Effective, true, cap.NET_BIND_SERVICE); err != nil {
	// 	return nil, fmt.Errorf("unable to set capability: %v", err)
	// }

	// if err := c.SetProc(); err != nil {
	// 	return nil, fmt.Errorf("unable to raise capabilities %q: %v", c, err)
	// }
	config := &gonet.ListenConfig{
		KeepAlive: defaultKeepAlive,
		Control:   nil,
	}
	return config.Listen(ctx, network, address)
}
