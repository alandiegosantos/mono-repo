def _load_json_config(ctx):
    json_data = json.decode(ctx.read(ctx.path(Label("//conf:k8s.json"))))
    config_lines = ["%s = %s" % (key, repr(val)) for key, val in json_data.items()]
    ctx.file("config.bzl", "\n".join(config_lines))
    ctx.file("BUILD.bazel", 'exports_files(["config.bzl"])')


load_json_config = repository_rule(
    implementation = _load_json_config,
    attrs = {},
)
