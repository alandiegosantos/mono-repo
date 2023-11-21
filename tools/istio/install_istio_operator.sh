#!/bin/bash

set -eux

ISTIO_VERSION=1.19.3

TMP_PATH=$(mktemp -d)

pushd $TMP_PATH

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh -

istio-${ISTIO_VERSION}/bin/istioctl operator init

popd

rm -rf $TMP_PATH
