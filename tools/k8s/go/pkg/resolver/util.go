package resolver

import corev1 "k8s.io/api/core/v1"

var (

	// These values are replaced by the stamper
	xdsBootstrapPath = "{GRPC_XDS_BOOTSTRAP}"
	entrypointImage  = "{ENTRYPOINT_IMAGE}"
	xdsServerAddress = "{XDS_SERVER}"
)

//go:inline
func entrypointInitContainer() corev1.Container {
	return corev1.Container{
		Name:  "entrypoint",
		Image: entrypointImage,
		Env: []corev1.EnvVar{
			{
				Name: "HOSTNAME",
				ValueFrom: &corev1.EnvVarSource{
					FieldRef: &corev1.ObjectFieldSelector{
						FieldPath: "metadata.name",
					},
				},
			},
			{
				Name: "CLUSTER",
				ValueFrom: &corev1.EnvVarSource{
					FieldRef: &corev1.ObjectFieldSelector{
						FieldPath: "metadata.labels['app']",
					},
				},
			},
			{
				Name: "REGION",
				ValueFrom: &corev1.EnvVarSource{
					FieldRef: &corev1.ObjectFieldSelector{
						FieldPath: "metadata.labels['region']",
					},
				},
			},
			{
				Name: "ZONE",
				ValueFrom: &corev1.EnvVarSource{
					FieldRef: &corev1.ObjectFieldSelector{
						FieldPath: "metadata.labels['zone']",
					},
				},
			},
			{
				Name: "SUBZONE",
				ValueFrom: &corev1.EnvVarSource{
					FieldRef: &corev1.ObjectFieldSelector{
						FieldPath: "metadata.labels['subzone']",
					},
				},
			},
			{
				Name:  "XDS_SERVER",
				Value: xdsServerAddress,
			},
			grpcXdsBootstrapEnv(),
		},
		VolumeMounts: []corev1.VolumeMount{
			grpcXdsBootstrapVolumeMount(false),
		},
	}
}

//go:inline
func grpcXdsBootstrapEnv() corev1.EnvVar {
	return corev1.EnvVar{
		Name:  "GRPC_XDS_BOOTSTRAP",
		Value: xdsBootstrapPath + "/xds-bootstrap.json",
	}
}

//go:inline
func grpcXdsBootstrapVolumeMount(readOnly bool) corev1.VolumeMount {
	return corev1.VolumeMount{
		Name:      "grpc-xds",
		MountPath: xdsBootstrapPath,
		ReadOnly:  readOnly,
	}
}
