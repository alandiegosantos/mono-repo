load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def cpp_repos(**kwargs):  # buildifier: disable=function-docstring
    git_repository(
        name = "com_github_gflags_gflags",
        remote = "https://github.com/gflags/gflags.git",
        commit = "e171aa2d15ed9eb17054558e0b3a6a413bb01067",
        shallow_since = "1541971260 +0000",
    )