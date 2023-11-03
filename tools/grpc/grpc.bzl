load("@com_github_grpc_grpc//bazel:cc_grpc_library.bzl", "cc_grpc_library")
load("@com_github_grpc_grpc//bazel:grpc_build_system.bzl", "grpc_proto_library")
load("@com_github_grpc_grpc//bazel:python_rules.bzl", "py_grpc_library", "py_proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")

GO_COMPILERS = [
    "@io_bazel_rules_go//proto:go_proto",
    "@grpc_ecosystem_grpc_gateway//protoc-gen-grpc-gateway:go_gen_grpc_gateway",
    "//third-party/go:protoc-gen-go-grpc",
]

PROTO_ANNOTATIONS_DEPS = [
    "@googleapis//google/api:annotations_proto",
]

GO_WORKSPACE_NAME = "github.com/alandiegosantos/monorepo"

GO_DEFAULT_DEPS = [
    "@org_golang_google_genproto_googleapis_api//annotations",
]

def _process_dependencies(deps, suffix):
    dependencies = []
    for dep in deps:
        if dep.startswith("@"):
            # Assuming external dependency, using as it is
            dependencies.append(dep)
        else: 
            # Assuming oter grpc_library dependency
            dependencies.append(dep + suffix)
    return dependencies

def grpc_library(name, srcs, languages = [], deps = [], visibility=None):

    # Add verification to check if the deps is a grpc_library

    proto_deps = _process_dependencies(deps, "_proto")

    proto_library(
        name = name + "_proto",
        srcs = srcs,
        deps = proto_deps + PROTO_ANNOTATIONS_DEPS,
        visibility = visibility,
    )

    _go_grpc_library(name, [name + "_proto"], _process_dependencies(deps, "_go"), visibility)
    _cc_grpc_library(name, srcs, _process_dependencies(deps, "_cpp"), visibility)


def _go_grpc_library(name, srcs, deps, visibility=None):

    import_path = GO_WORKSPACE_NAME + "/" + native.package_name()

    go_proto_library(
        name = name + "_go",
        compilers = GO_COMPILERS,
        importpath = import_path,
        protos = srcs,
        deps = deps + GO_DEFAULT_DEPS,
        visibility = visibility,
    )

def _cc_grpc_library(name, srcs, deps, visibility = None):

    cc_grpc_library(
        name = name + "_cpp",
        srcs = srcs,
        grpc_only = False,
        deps = deps,
        visibility = visibility,
    )

def _istio_grpc_library(name, srcs, deps, visibility = None):

    