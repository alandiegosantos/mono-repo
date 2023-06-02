load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def argocd_repos(**kwargs):  # buildifier: disable=function-docstring
    http_file(
        name = "argocd_install",
        downloaded_file_path = "install.yaml",
        sha256 = "7a8e21e67b7a5b4839b15f0fe3720ed1c0f0358b03838a581fc01a1f1fcc6ea3",
        urls = ["https://raw.githubusercontent.com/argoproj/argo-cd/v2.7.3/manifests/install.yaml"],
    )
