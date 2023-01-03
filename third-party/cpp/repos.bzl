load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@com_google_googleapis//:repository_rules.bzl", "switched_rules_by_language")
load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)
load(
    "@io_bazel_rules_docker//cc:image.bzl",
    _cc_image_repos = "repositories",
)

def cpp_repos(**kwargs):  # buildifier: disable=function-docstring
    git_repository(
        name = "com_github_gflags_gflags",
        remote = "https://github.com/gflags/gflags.git",
        commit = "e171aa2d15ed9eb17054558e0b3a6a413bb01067",
        shallow_since = "1541971260 +0000",
    )

    # Initialize Google APIs with only C++ and Python targets
    # this call is included in grpc_extra_deps
    # buit it also instantiate a golang toolchain
    # and that was breaking the build of golang binaries
    switched_rules_by_language(
        name = "com_google_googleapis_imports",
        cc = True,
        grpc = True,
        python = True,
    )

    _cc_image_repos()

    maybe(
        container_pull,
        name = "cc_base",
        registry = "gcr.io",
        repository = "distroless/cc",
        tag = "latest",
    )
