package registry

import "github.com/pkg/errors"

var (
	ClusterNotFound        = errors.New("cluster not found")
	NodeInformationInvalid = errors.New("node information is missing information")
)
