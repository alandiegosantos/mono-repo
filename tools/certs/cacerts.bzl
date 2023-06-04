"""A rule to unpack ca certificates from the debian package."""
# TODO This depends on tar installed on the build node, we should compile it or come up with a different script
def _cacerts_impl(ctx):
    ctx.actions.run_shell(
        inputs = [ctx.file.deb],
        outputs = [ctx.outputs.tar],
        tools = [] + ctx.files._dpkg_extract,
        arguments = [
            ctx.file.deb.path,
            ctx.outputs.tar.path,
        ],
        env = {
            "EXTRACT_DEB": ctx.executable._dpkg_extract.path,
        },
        command = """
            set -o errexit

            $EXTRACT_DEB "$1" ./usr/share/ca-certificates ./usr/share/doc/ca-certificates/copyright

            CERT_FILE=./etc/ssl/certs/ca-certificates.crt
            mkdir -p $(dirname $CERT_FILE)

            CERTS=$(find usr/share/ca-certificates -type f | sort)
            for cert in $CERTS; do
              cat $cert >> $CERT_FILE
            done

            tar -cf "$2" \
                        $CERT_FILE \
                        ./usr/share/doc/ca-certificates/copyright
        """,
    )

def _copy_local_ca_certs_impl(ctx):
    ctx.actions.run_shell(
        outputs = [ctx.outputs.tar],
        tools = [],
        arguments = [
            ctx.outputs.tar.path,
        ],
        command = """
            set -o errexit
            CERT_FILE=./etc/ssl/certs/ca-certificates.crt

            mkdir -p $(dirname $CERT_FILE)
            cp /etc/ssl/certs/ca-certificates.crt $CERT_FILE

            tar -cf "$1" $CERT_FILE
        """,
    )


cacerts = rule(
    attrs = {
        "deb": attr.label(
            allow_single_file = [".deb"],
            mandatory = True,
        ),
        "_dpkg_extract": attr.label(
            default = Label("//tools/argocd/cacerts:dpkg_extract"),
            cfg = "host",
            executable = True,
        ),
    },
    executable = False,
    outputs = {
        "tar": "%{name}.tar",
    },
    implementation = _cacerts_impl,
)


copy_local_ca_certs = rule(
    executable = False,
    outputs = {
        "tar": "%{name}.tar",
    },
    implementation = _copy_local_ca_certs_impl,
)
