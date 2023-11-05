load("@io_grpc_grpc_java//:repositories.bzl", "grpc_java_repositories")
load("@maven//:compat.bzl", "compat_repositories")

def java_repos(**kwargs):  # buildifier: disable=function-docstring
    grpc_java_repositories()

    compat_repositories()