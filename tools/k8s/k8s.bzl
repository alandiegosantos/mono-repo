load("@com_adobe_rules_gitops//gitops:defs.bzl", "k8s_deploy")
load("@monorepo_k8s_config//:config.bzl","CLUSTERS", "REGISTRY")

def multi_k8s_deploy(
    name, 
    manifests, 
    common_labels, 
    namespace,
    images,
):

    for cluster in CLUSTERS:
        k8s_deploy(
            name = "release-" + cluster["name"],
            cluster = cluster["name"],
            image_registry = REGISTRY,  # override the default registry host for developent
            images = images,
            manifests = manifests,
            common_labels = common_labels,
            namespace = namespace,
            user = cluster["user"],
        )