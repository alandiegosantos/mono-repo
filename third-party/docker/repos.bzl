load(":debian_archives.bzl", local_debian_archives = "debian_archives")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@rules_oci//oci:pull.bzl", "oci_pull")

IMAGES = {
    "static-debian12": "sha256:0a944ba09780b6a4e7a8f30287f88a70d7914ad2ba878233ff8cfffb7479158c",
    "base-debian12": "sha256:0a944ba09780b6a4e7a8f30287f88a70d7914ad2ba878233ff8cfffb7479158c",
    "cc-debian12": "sha256:0a944ba09780b6a4e7a8f30287f88a70d7914ad2ba878233ff8cfffb7479158c",
    "java-base-debian12": "sha256:0a944ba09780b6a4e7a8f30287f88a70d7914ad2ba878233ff8cfffb7479158c",
    "java17-debian12": "sha256:0a944ba09780b6a4e7a8f30287f88a70d7914ad2ba878233ff8cfffb7479158c",
    "python3-debian12": "sha256:0a944ba09780b6a4e7a8f30287f88a70d7914ad2ba878233ff8cfffb7479158c",
}


def docker_repos(**kwargs):

    for image, digest in IMAGES.items():
        oci_pull(
            name = image,
            digest = digest,
            image = "gcr.io/distroless/" + image,
            platforms = [
                "linux/amd64",
            ],
        )
