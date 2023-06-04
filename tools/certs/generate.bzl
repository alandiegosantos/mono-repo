# TODO: Depends on the availability of openssl and the CA files
# in the build node
load("@mono_certs_config//:config.bzl", "CA_KEY_FILE", "CA_CRT_FILE")

def _generate_certificate_impl(ctx):
    ctx.actions.run_shell(
        inputs = [],
        outputs = [ctx.outputs.key, ctx.outputs.crt, ctx.outputs.csr],
        tools = [],
        arguments = [
            ctx.outputs.key.path,
            ctx.outputs.crt.path,
            ctx.outputs.csr.path,
            ctx.attr.cn,
            ctx.attr.dns,
            CA_KEY_FILE,
            CA_CRT_FILE,
        ],
        command = """
            set -o errexit

            CERT_KEY_FILE=$1
            CERT_FILE=$2
            CSR_FILE=$3
            CN=$4
            DNS_NAME=$5
            CA_KEY_FILE=$6
            CA_CERT_FILE=$7

            openssl req -out $CSR_FILE -newkey rsa:4096 -nodes -keyout $CERT_KEY_FILE -subj "$CN"

            openssl x509 -req -in $CSR_FILE -CA $CA_CERT_FILE -CAkey $CA_KEY_FILE -CAcreateserial -out $CERT_FILE -days 825 -sha256 -extfile <(printf "subjectAltName = @alt_names\n[alt_names]\nDNS.1 = $DNS_NAME")
        """,
    )

generate_certificate = rule(
    attrs = {
        "cn": attr.string(
            doc = "dns name",
            mandatory = True,
        ),
        "dns": attr.string(
            doc = "dns name",
            mandatory = True,
        ),
    },
    executable = False,
    outputs = {
        "key": "%{name}.key",
        "crt": "%{name}.crt",
        "csr": "%{name}.csr",
    },
    implementation = _generate_certificate_impl,
)
