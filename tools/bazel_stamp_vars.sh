#!/usr/bin/env bash
echo GIT_COMMIT $(git rev-parse HEAD)
echo GRPC_XDS_BOOTSTRAP /var/tmp/grpc-xds
echo ENTRYPOINT_IMAGE localhost:5000/infra/entrypoint@sha256:65969f98bbfb414089ee4af649eb2d75a47682bed41aa4bb5766ff58116eb467
echo XDS_SERVER xdsserver.infra:50050
