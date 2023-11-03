load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("//third-party/go:deps.bzl", "go_dependencies")

def go_repos():  # buildifier: disable=function-docstring

    go_dependencies()

    gazelle_dependencies(go_repository_default_config = "//third-party/go:repos.bzl")
