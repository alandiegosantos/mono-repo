workspace(name = "monorepo")

load("//tools/bazel:jsonparser.bzl", "load_json_config")

load_json_config(
    name = "monorepo_k8s_config",
    file = "//conf:k8s.json",
)

load_json_config(
    name = "mono_certs_config",
    file = "//conf:certs.json",
)

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "91585017debb61982f7054c9688857a2ad1fd823fc3f9cb05048b0025c47d023",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.42.0/rules_go-v0.42.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.42.0/rules_go-v0.42.0.zip",
    ],
)

http_archive(
    name = "bazel_skylib",
    sha256 = "66ffd9315665bfaafc96b52278f57c7e2dd09f5ede279ea6d39b2be471e7e3aa",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.2/bazel-skylib-1.4.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.2/bazel-skylib-1.4.2.tar.gz",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "d3fa66a39028e97d76f9e2db8f1b0c11c099e8e01bf363a923074784e451f809",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.33.0/bazel-gazelle-v0.33.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.33.0/bazel-gazelle-v0.33.0.tar.gz",
    ],
)

git_repository(
    name = "com_github_grpc_grpc",
    patch_args = [
        "-p1",
    ],
    patches = [
        "//third-party/grpc:golang-1.21.patch",
    ],
    remote = "https://github.com/grpc/grpc",
    tag = "v1.59.1",
)

http_archive(
    name = "rules_oci",
    sha256 = "21a7d14f6ddfcb8ca7c5fc9ffa667c937ce4622c7d2b3e17aea1ffbc90c96bed",
    strip_prefix = "rules_oci-1.4.0",
    url = "https://github.com/bazel-contrib/rules_oci/releases/download/v1.4.0/rules_oci-v1.4.0.tar.gz",
)

http_archive(
    name = "aspect_bazel_lib",
    sha256 = "cbf473d630ab67b36461d83b38fdc44e56f45b78d03c405e4958280211124d79",
    strip_prefix = "bazel-lib-1.36.0",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v1.36.0/bazel-lib-v1.36.0.tar.gz",
)

git_repository(
    name = "grpc_ecosystem_grpc_gateway",
    remote = "https://github.com/grpc-ecosystem/grpc-gateway.git",
    tag = "v2.18.0",
)

git_repository(
    name = "com_google_googleapis",
    commit = "6e1a5a066659794f26091674e3668229e7750052",
    remote = "https://github.com/googleapis/googleapis",
    shallow_since = "1668013046 -0800",
)

git_repository(
    name = "googleapis",
    commit = "6e1a5a066659794f26091674e3668229e7750052",
    remote = "https://github.com/googleapis/googleapis",
    shallow_since = "1668013046 -0800",
)

http_archive(
    name = "com_adobe_rules_gitops",
    sha256 = "83124a8056b1e0f555c97adeef77ec6dff387eb3f5bc58f212b376ba06d070dd",
    strip_prefix = "rules_gitops-0.17.2",
    urls = ["https://github.com/adobe/rules_gitops/archive/refs/tags/v0.17.2.tar.gz"],
    
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.21.1")

load("//third-party/go:repos.bzl", "go_repos")

go_repos()

load("//third-party/cpp:repos.bzl", "cpp_repos")

cpp_repos()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps", "grpc_test_only_deps")

grpc_deps()

grpc_test_only_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()

load("@rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")

rules_oci_dependencies()

load("@rules_oci//oci:repositories.bzl", "LATEST_CRANE_VERSION", "LATEST_ZOT_VERSION", "oci_register_toolchains")

oci_register_toolchains(
    name = "oci",
    crane_version = LATEST_CRANE_VERSION,
)

load("//third-party/cpp:repos.bzl", "cpp_repos")

cpp_repos()

load("//third-party/docker:repos.bzl", "docker_repos")

docker_repos()

load("@com_adobe_rules_gitops//gitops:deps.bzl", "rules_gitops_dependencies")

rules_gitops_dependencies()

load("@com_adobe_rules_gitops//gitops:repositories.bzl", "rules_gitops_repositories")

rules_gitops_repositories()
