load("@io_grpc_grpc_java//:repositories.bzl", "grpc_java_repositories")
load("@maven//:compat.bzl", "compat_repositories")
load(
    "@io_bazel_rules_docker//java:image.bzl",
    _java_image_repos = "repositories",
)

def java_repos(**kwargs):  # buildifier: disable=function-docstring
    grpc_java_repositories()

    compat_repositories()

    _java_image_repos()
