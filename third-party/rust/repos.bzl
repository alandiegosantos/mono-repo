load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@rules_rust//rust/private:common.bzl", "rust_common")
load("@rules_rust//rust:repositories.bzl", "DEFAULT_TOOLCHAIN_TRIPLES", "rules_rust_dependencies", "rust_register_toolchains", "rust_toolchain_tools_repository")
load("@cargo_raze//:repositories.bzl", "cargo_raze_repositories")
load("@cargo_raze//:transitive_deps.bzl", "cargo_raze_transitive_deps")
load("@rules_rust//proto:repositories.bzl", "rust_proto_repositories")
load("@rules_rust//proto:transitive_repositories.bzl", "rust_proto_transitive_repositories")
load("//third-party/rust/cargo:crates.bzl", "raze_fetch_remote_crates")

def rust_repos(**kwargs):  # buildifier: disable=function-docstring
    rules_rust_dependencies()

    # rust_analyzer_dependencies()
    rust_register_toolchains(edition = "2021", include_rustc_srcs = True)
    rust_proto_repositories()
    rust_proto_transitive_repositories()

    maybe(
        http_archive,
        name = "cargo_raze__iconv",
        urls = [
            "https://github.com/apple-oss-distributions/libiconv/archive/libiconv-64.tar.gz",
        ],
        type = "tar.gz",
        sha256 = "5789c5fd0ab59c9ae63c9dfdfc434c8aac22ac3b3cdae70a851dc5b52df82fe2",
        strip_prefix = "libiconv-libiconv-64/libiconv",
        build_file = Label("@cargo_raze//third_party/iconv:BUILD.iconv.bazel"),
    )

    for exec_triple, name in DEFAULT_TOOLCHAIN_TRIPLES.items():
        maybe(
            rust_toolchain_tools_repository,
            name + "_tools",
            edition = "2021",
            exec_triple = exec_triple,
            target_triple = exec_triple,
            version = rust_common.default_version,
        )

    # To run cargo raze
    cargo_raze_repositories()
    cargo_raze_transitive_deps()

    # Note that this method's name depends on your gen_workspace_prefix setting.
    # `raze` is the default prefix.
    raze_fetch_remote_crates()
