load(
    "@io_bazel_rules_docker//python3:image.bzl",
    _py_image_repos = "repositories",
)

def python_repos(**kwargs):  # buildifier: disable=function-docstring
    _py_image_repos()
