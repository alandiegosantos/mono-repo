load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@grpc_ecosystem_grpc_gateway//:repositories.bzl", grpc_ecosystem_grpc_gateway_go_repositories = "go_repositories")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("//third-party/go:deps.bzl", "go_dependencies")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def go_repos(**kwargs):  # buildifier: disable=function-docstring
    go_rules_dependencies()
    go_register_toolchains(version = "1.19.2")

    grpc_ecosystem_grpc_gateway_go_repositories()

    gazelle_dependencies(go_repository_default_config = "//third-party/go:repos.bzl")

    go_dependencies()

    git_repository(
        name = "com_github_grpc_grpc_go",
        remote = "https://github.com/grpc/grpc-go",
        # Using tag = "v1.50.1",
        commit = "4c776ec01572d55249df309251900554b46adb41",
        shallow_since = "1665784802 -0400",
        patches = [
            "//third-party/go/tools:protoc-gen-go-grpc.patch",
        ],
        patch_args = [
            "-p1",
        ],
    )
