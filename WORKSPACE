workspace(name = "mono_repo")

load("//tools/bazel:jsonparser.bzl", "load_json_config")

load_json_config(
    name = "monorepo_k8s_config",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
    name = "rules_proto",
    sha256 = "80d3a4ec17354cccc898bfe32118edd934f851b03029d63ef3fc7c8663a7415c",
    strip_prefix = "rules_proto-5.3.0-21.5",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/refs/tags/5.3.0-21.5.tar.gz",
    ],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "acb71ce46502683c31d4f15bafb611b9e7b858b6024804d6fb84b85750884208",
    strip_prefix = "protobuf-3.20.3",
    url = "https://github.com/protocolbuffers/protobuf/releases/download/v3.20.3/protobuf-all-3.20.3.tar.gz",
)

git_repository(
    name = "com_google_googleapis",
    commit = "6e1a5a066659794f26091674e3668229e7750052",
    remote = "https://github.com/googleapis/googleapis",
    shallow_since = "1668013046 -0800",
)

git_repository(
    name = "com_github_grpc_grpc",
    commit = "90ccf24d22b6fc909a1021ebd89fd8c838467d26",
    remote = "https://github.com/grpc/grpc",
    shallow_since = "1666336283 +0200",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "099a9fb96a376ccbbb7d291ed4ecbdfd42f6bc822ab77ae6f1b5cb9e914e94fa",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
    ],
)

http_archive(
    name = "rules_rust",
    sha256 = "696b01deea96a5e549f1b5ae18589e1bbd5a1d71a36a243b5cf76a9433487cf2",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_rust/releases/download/0.11.0/rules_rust-v0.11.0.tar.gz",
        "https://github.com/bazelbuild/rules_rust/releases/download/0.11.0/rules_rust-v0.11.0.tar.gz",
    ],
)

http_archive(
    name = "cargo_raze",
    patch_args = [
        "-p1",
    ],
    patches = [
        "//third-party/rust:cargo_raze.patch",
    ],
    sha256 = "fa16f00e6b4ad0452c21ebf30d6d36cf2d1ada1cbad76e5dfb33c161cad3e785",
    strip_prefix = "cargo-raze-0.16.0",
    url = "https://github.com/google/cargo-raze/archive/v0.16.0.tar.gz",
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "2a4d07cd64b0719b39a7c12218a3e507672b82a97b98c6a89d38565894cf7c51",
    strip_prefix = "rules_foreign_cc-0.9.0",
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/refs/tags/0.9.0.tar.gz",
)

git_repository(
    name = "grpc_ecosystem_grpc_gateway",
    commit = "1dac1ac6439c7e32714601b945e84f21b23d9cbd",
    remote = "https://github.com/grpc-ecosystem/grpc-gateway.git",
    shallow_since = "1666025938 -0700",
)

git_repository(
    name = "io_grpc_grpc_java",
    commit = "a07c5a1d7e697338726976ae5e688159fbf62710",
    patch_args = [
        "-p1",
    ],
    patches = [
        "//third-party/java:io_grpc_grpc_java.patch",
    ],
    remote = "https://github.com/grpc/grpc-java.git",
    shallow_since = "1666214883 -0700",
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6",
    strip_prefix = "rules_jvm_external-4.5",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/refs/tags/4.5.zip",
)

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "12057b7aa904467284eee640de5e33853e51d8e31aae50b3fb25d2823d51c6b8",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.0.0/rules_swift.1.0.0.tar.gz",
)

http_archive(
    name = "rules_python",
    sha256 = "8c8fe44ef0a9afc256d1e75ad5f448bb59b81aba149b8958f02f7b3a98f5d9b4",
    strip_prefix = "rules_python-0.13.0",
    url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.13.0.tar.gz",
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
)

git_repository(
    name = "com_github_googlecontainertools_distroless",
    commit = "c0d1303e3d1f536db7aa2fa3c00555f5b1ce184f",
    remote = "https://github.com/GoogleContainerTools/distroless",
    shallow_since = "1672025290 -0500",
)

http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "ce5b9bc0926681e2e7f2147b49096f143e6cbc783e71bc1d4f36ca76b00e6f4a",
    strip_prefix = "rules_k8s-0.7",
    urls = ["https://github.com/bazelbuild/rules_k8s/archive/refs/tags/v0.7.tar.gz"],
)

http_archive(
    name = "com_adobe_rules_gitops",
    sha256 = "83124a8056b1e0f555c97adeef77ec6dff387eb3f5bc58f212b376ba06d070dd",
    strip_prefix = "rules_gitops-0.17.2",
    urls = ["https://github.com/adobe/rules_gitops/archive/refs/tags/v0.17.2.tar.gz"],
    patch_args = [
        "-p1",
    ],
    patches = [
        "//tools/bazel:gitops_arm64.patch",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps", "grpc_test_only_deps")

grpc_deps()

grpc_test_only_deps()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load("//third-party/go:repos.bzl", "go_repos")

go_repos()

load("//third-party/cpp:repos.bzl", "cpp_repos")

cpp_repos()

load("//third-party/docker:repos.bzl", "docker_repos")

docker_repos()

load("//third-party/rust:repos.bzl", "rust_repos")

rust_repos()

# Java dependencies

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

load("@io_grpc_grpc_java//:repositories.bzl", "IO_GRPC_GRPC_JAVA_ARTIFACTS", "IO_GRPC_GRPC_JAVA_OVERRIDE_TARGETS")
load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "org.apache.logging.log4j:log4j-core:2.19.0",
        "io.netty:netty-all:4.1.87.Final",
    ] + IO_GRPC_GRPC_JAVA_ARTIFACTS,
    generate_compat_repositories = True,
    override_targets = IO_GRPC_GRPC_JAVA_OVERRIDE_TARGETS,
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2/",
    ],
)

load("//third-party/java:repos.bzl", "java_repos")

java_repos()

load("@rules_python//python:repositories.bzl", "python_register_toolchains")

python_register_toolchains(
    name = "python",
    python_version = "3.10",
)

load("@python//:defs.bzl", "interpreter")
load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
    name = "pypi",
    python_interpreter_target = interpreter,
    requirements = "//third-party/python:requirements_lock.txt",
)

load("@pypi//:requirements.bzl", "install_deps")

install_deps()

load("//third-party/python:repos.bzl", "python_repos")

python_repos()

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_repositories")

k8s_repositories()

load("@io_bazel_rules_k8s//k8s:k8s_go_deps.bzl", k8s_go_deps = "deps")

k8s_go_deps(go_version = None)

load("@com_adobe_rules_gitops//gitops:deps.bzl", "rules_gitops_dependencies")

rules_gitops_dependencies()

load("@com_adobe_rules_gitops//gitops:repositories.bzl", "rules_gitops_repositories")

rules_gitops_repositories()

load("//tools/argocd:repos.bzl", "argocd_repos")

argocd_repos()
