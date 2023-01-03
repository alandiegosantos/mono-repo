load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")
load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)
load("@com_github_googlecontainertools_distroless//:debian_archives.bzl", debian_archives = "repositories")
load(":debian_archives.bzl", local_debian_archives = "debian_archives")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")


def docker_repos(**kwargs):  # buildifier: disable=function-docstring
    container_repositories()
    container_deps()

    # go_images is loaded here because docker_repos depends on go_repos
    _go_image_repos()

    debian_archives()

    local_debian_archives()
