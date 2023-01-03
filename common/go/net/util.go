package net

import (
	"errors"
	gonet "net"
)

var NoIPFound = errors.New("No non-loopback IP found")

// Get preferred outbound ip of this machine
func GetInboundIP() (gonet.IP, error) {
	addrs, err := gonet.InterfaceAddrs()
	if err != nil {
		return nil, err
	}
	for _, a := range addrs {
		if ipNet, ok := a.(*gonet.IPNet); ok && !ipNet.IP.IsLoopback() {
			if ipNet.IP.To4() != nil {
				return ipNet.IP, nil
			}
		}
	}
	return nil, NoIPFound
}
