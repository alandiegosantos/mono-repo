load("@rules_pkg//pkg:tar.bzl", "pkg_tar")
load("@io_bazel_rules_docker//container:container.bzl", "container_image", "container_push")

GO_DEFAULT_BASE = "@com_github_googlecontainertools_distroless//cc:cc_nonroot_arm64_debian11"
CC_DEFAULT_BASE = "@com_github_googlecontainertools_distroless//cc:cc_nonroot_arm64_debian11"
JAVA_DEFAULT_BASE = "@com_github_googlecontainertools_distroless//java:java11_nonroot_arm64_debian11"
PYTHON_DEFAULT_BASE = "//third-party/docker:python3_nonroot_arm64_debian11"
