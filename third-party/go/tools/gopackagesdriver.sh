#!/usr/bin/env bash
export GOPACKAGESDRIVER_RULES_GO_REPOSITORY_NAME=@io_bazel_rules_go
exec bazel run --tool_tag=gopackagesdriver -- @io_bazel_rules_go//go/tools/gopackagesdriver:gopackagesdriver "${@}"
