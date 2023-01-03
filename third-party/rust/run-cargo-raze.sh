#!/bin/sh
exec bazel run @cargo_raze//:raze -- --manifest-path=$(realpath third-party/rust/Cargo.toml) --generate-lockfile
