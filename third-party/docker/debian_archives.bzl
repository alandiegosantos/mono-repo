load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def debian_archives(**kwargs):  # buildifier: disable=function-docstring

    http_file(
        name = "arm64_libc-bin",
        downloaded_file_path = "libc-bin_2.36-6_arm64.deb",
        sha256 = "4cfa3c2e3f498ebe84cb55542cfee42acde08b40fc30f28bbdce27a2f3c3dbe9",
        urls = ["https://snapshot.debian.org/archive/debian/20221217T151645Z/pool/main/g/glibc/libc-bin_2.36-6_arm64.deb"],
    )

    http_file(
        name = "arm64_libc6",
        downloaded_file_path = "libc-bin_2.36-6_arm64.deb",
        sha256 = "a8dc87b15599129a0b057b9862ad28d4ab9584fa9c37dcabab82518638e13d59",
        urls = ["https://snapshot.debian.org/archive/debian/20221217T151645Z/pool/main/g/glibc/libc6_2.36-6_arm64.deb"],
    )

    http_file(
        name = "arm64_libstdcpp6",
        downloaded_file_path = "libstdc%2B%2B6_12.2.0-10_arm64.deb",
        sha256 = "552e9f3e397d7b5bd29def30366125f2836e68de8e36bf2060751c1d66f230ec",
        urls = ["https://snapshot.debian.org/archive/debian/20221217T151645Z/pool/main/g/gcc-12/libstdc%2B%2B6_12.2.0-10_arm64.deb"],
    )
