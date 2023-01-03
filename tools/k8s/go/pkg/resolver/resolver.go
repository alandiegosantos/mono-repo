package resolver

import (
	"bytes"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"path"

	"github.com/bazelbuild/rules_docker/container/go/pkg/compat"
	"github.com/bazelbuild/rules_docker/container/go/pkg/utils"
	"github.com/google/go-containerregistry/pkg/authn"
	"github.com/google/go-containerregistry/pkg/name"
	"github.com/google/go-containerregistry/pkg/v1/remote"

	appsv1 "k8s.io/api/apps/v1"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/api/resource"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/runtime/serializer/json"
	"k8s.io/apimachinery/pkg/util/intstr"
	"k8s.io/client-go/kubernetes/scheme"
)

// Flags defines the flags that rules_k8s may pass to the resolver
type Flags struct {
	ImgChroot         string
	K8sTemplate       string
	SubstitutionsFile string
	AllowUnusedImages bool
	NoPush            bool
	StampInfoFile     utils.ArrayStringFlags
	ImgSpecs          utils.ArrayStringFlags
}

// Commandline flags
const (
	FlagImgChroot         = "image_chroot"
	FlagK8sTemplate       = "template"
	FlagSubstitutionsFile = "substitutions"
	FlagAllowUnusedImages = "allow_unused_images"
	FlagNoPush            = "no_push"
	FlagImgSpecs          = "image_spec"
	FlagStampInfoFile     = "stamp-info-file"
)

var grpcXdsSizeLimit = resource.MustParse("10Mi")

// RegisterFlags will register the resolvers flags with the provided FlagSet.
// It returns a struct that will contain the values once flags are parsed.
// The caller is responsible for parsing flags when ready.
func RegisterFlags(flagset *flag.FlagSet) *Flags {
	var flags Flags

	flagset.StringVar(&flags.ImgChroot, FlagImgChroot, "", "The repository under which to chroot image references when publishing them.")
	flagset.StringVar(&flags.K8sTemplate, FlagK8sTemplate, "", "The k8s YAML template file to resolve.")
	flagset.StringVar(&flags.SubstitutionsFile, FlagSubstitutionsFile, "", "A file with a list of substitutions that were made in the YAML template. Any stamp values that appear are stamped by the resolver.")
	flagset.BoolVar(&flags.AllowUnusedImages, FlagAllowUnusedImages, true, "Allow images that don't appear in the JSON. This is useful when generating multiple SKUs of a k8s_object, only some of which use a particular image.")
	flagset.BoolVar(&flags.NoPush, FlagNoPush, false, "Don't push images after resolving digests.")
	flagset.Var(&flags.ImgSpecs, FlagImgSpecs, "Associative lists of the constitutent elements of a docker image.")
	flagset.Var(&flags.StampInfoFile, FlagStampInfoFile, "One or more Bazel stamp info files.")

	return &flags
}

// Option can be passed to NewResolver to configure the resolver.
type Option func(r *Resolver)

// Resolver performs substitutions and resolves/pushes images
type Resolver struct {
	flags *Flags
	// parseTag is called instead of name.NewTag, which allows overriding how image
	// tags are parsed.
	parseTag func(name string, opts ...name.Option) (name.Tag, error)

	resolvedImages map[string]string
}

// NewResolver takes some Flags and returns a Resolver
func NewResolver(flags *Flags, option ...Option) *Resolver {
	r := &Resolver{
		flags:    flags,
		parseTag: name.NewTag,
	}
	for _, opt := range option {
		opt(r)
	}
	return r
}

// Resolve will parse the files pointed by the flags and return a resolvedTemplate and error as applicable
func (r *Resolver) Resolve() (string, error) {
	stamper, err := compat.NewStamper(r.flags.StampInfoFile)
	if err != nil {
		return "", fmt.Errorf("Failed to initialize the stamper: %w", err)
	}

	specs := []imageSpec{}
	for _, s := range r.flags.ImgSpecs {
		spec, err := parseImageSpec(s)
		if err != nil {
			return "", fmt.Errorf("Unable to parse image spec %q: %s", s, err)
		}
		specs = append(specs, spec)
	}

	r.resolvedImages, _, err = r.publish(specs, stamper)
	if err != nil {
		return "", fmt.Errorf("Unable to publish images: %w", err)
	}

	manifest, err := r.resolveTemplate(r.flags.K8sTemplate)

	return stamper.Stamp(manifest), err
}

func (r *Resolver) resolveTemplate(templateFile string) (string, error) {
	template, err := ioutil.ReadFile(templateFile)
	if err != nil {
		return "", err
	} else if len(template) == 0 {
		return "", nil
	}

	objs := make([]runtime.Object, 0)

	s := json.NewYAMLSerializer(json.DefaultMetaFactory, scheme.Scheme,
		scheme.Scheme)

	obj, _, err := s.Decode([]byte(template), nil, nil)
	if err != nil {
		return "", err
	}

	switch v := obj.(type) {
	case *appsv1.Deployment:
		// Encode the object to YAML.
		deployment, err := r.templateDeployment(v)
		if err != nil {
			return "", err
		}
		objs = append(objs, deployment)

		svc := r.createK8sService(deployment)

		objs = append(objs, svc)
	default:
		log.Fatalf("type %T not supported", v)
	}

	return r.encodeObjects(objs)
}

func (r *Resolver) publish(spec []imageSpec, stamper *compat.Stamper) (map[string]string, map[string]bool, error) {
	overrides := make(map[string]string)
	unseen := make(map[string]bool)
	for _, s := range spec {
		digestRef, err := r.publishSingle(s, stamper)
		if err != nil {
			return nil, nil, err
		}
		overrides[s.name] = digestRef
		unseen[s.name] = true
	}
	return overrides, unseen, nil
}

// publishSingle publishes a docker image with the given spec to the remote
// registry indicated in the image name. The image name is stamped with the
// given stamper.
// The stamped image name is returned referenced by its sha256 digest.
func (r *Resolver) publishSingle(spec imageSpec, stamper *compat.Stamper) (string, error) {
	layers, err := spec.layers()
	if err != nil {
		return "", fmt.Errorf("unable to convert the layer parts in image spec for %s into a single comma separated argument: %v", spec.name, err)
	}

	imgParts, err := compat.ImagePartsFromArgs(spec.imgConfig, "", spec.imgTarball, layers)
	if err != nil {
		return "", fmt.Errorf("unable to determine parts of the image from the specified arguments: %v", err)
	}
	cr := compat.Reader{Parts: imgParts}
	img, err := cr.ReadImage()
	if err != nil {
		return "", fmt.Errorf("error reading image: %v", err)
	}
	stampedName := stamper.Stamp(spec.name)

	var ref name.Reference
	if r.flags.ImgChroot != "" {
		n := path.Join(r.flags.ImgChroot, stampedName)
		t, err := r.parseTag(n, name.WeakValidation)
		if err != nil {
			return "", fmt.Errorf("unable to create a docker tag from stamped name %q: %v", n, err)
		}
		ref = t
	} else {
		t, err := r.parseTag(stampedName, name.WeakValidation)
		if err != nil {
			return "", fmt.Errorf("unable to create a docker tag from stamped name %q: %v", stampedName, err)
		}
		ref = t
	}
	auth, err := authn.DefaultKeychain.Resolve(ref.Context())
	if err != nil {
		return "", fmt.Errorf("unable to get authenticator for image %v", ref.Name())
	}

	if !r.flags.NoPush {
		if err := remote.Write(ref, img, remote.WithAuth(auth)); err != nil {
			return "", fmt.Errorf("unable to push image %v: %v", ref.Name(), err)
		}
	}

	d, err := img.Digest()
	if err != nil {
		return "", fmt.Errorf("unable to get digest of image %v", ref.Name())
	}

	return fmt.Sprintf("%s/%s@%v", ref.Context().RegistryStr(), ref.Context().RepositoryStr(), d), nil
}

func (r *Resolver) templateDeployment(deployment *appsv1.Deployment) (*appsv1.Deployment, error) {
	deployment = deployment.DeepCopy()

	containers := deployment.Spec.Template.Spec.Containers
	for i := range containers {
		image, err := r.resolveImage(containers[i].Image)
		if err != nil {
			return nil, err
		}
		containers[i].Image = image

		containers[i].VolumeMounts = append(
			containers[i].VolumeMounts,
			grpcXdsBootstrapVolumeMount(true),
		)

		containers[i].Env = append(
			containers[i].Env,
			grpcXdsBootstrapEnv(),
		)
	}

	initContainers := deployment.Spec.Template.Spec.InitContainers
	for i := range initContainers {
		image, err := r.resolveImage(initContainers[i].Image)
		if err != nil {
			return nil, err
		}
		initContainers[i].Image = image
	}

	deployment.Spec.Template.Spec.InitContainers = append(initContainers,
		entrypointInitContainer(),
	)

	deployment.Spec.Template.Spec.Volumes = append(
		deployment.Spec.Template.Spec.Volumes,
		corev1.Volume{
			Name: "grpc-xds",
			VolumeSource: corev1.VolumeSource{
				EmptyDir: &corev1.EmptyDirVolumeSource{
					Medium:    "Memory",
					SizeLimit: &grpcXdsSizeLimit,
				},
			},
		},
	)

	return deployment, nil
}

func (r *Resolver) resolveImage(image string) (string, error) {
	o, ok := r.resolvedImages[image]
	if ok {
		return o, nil
	}

	// Search for the image in the repo
	t, err := name.NewTag(image, name.StrictValidation)
	if err != nil {
		return image, nil
	}
	auth, err := authn.DefaultKeychain.Resolve(t.Context())
	if err != nil {
		return image, nil
	}
	desc, err := remote.Get(t, remote.WithAuth(auth))
	if err != nil {
		return image, nil
	}
	resolved := fmt.Sprintf("%s/%s@%v", t.Context().RegistryStr(), t.Context().RepositoryStr(), desc.Digest)
	r.resolvedImages[image] = resolved

	return resolved, nil
}

// createK8sService creates the Kubernetes Service to match the deployment
func (r *Resolver) createK8sService(deployment *appsv1.Deployment) *corev1.Service {
	selector := deployment.Spec.Template.GetObjectMeta().GetLabels()

	ports := make([]corev1.ServicePort, 0)

	// Iterate over all containerPorts
	for _, container := range deployment.Spec.Template.Spec.Containers {
		for _, port := range container.Ports {
			ports = append(
				ports,
				corev1.ServicePort{
					Name:       port.Name,
					Protocol:   port.Protocol,
					Port:       port.ContainerPort,
					TargetPort: intstr.FromInt(int(port.ContainerPort)),
				},
			)
		}
	}

	return &corev1.Service{
		TypeMeta: metav1.TypeMeta{
			APIVersion: "v1",
			Kind:       "Service",
		},
		ObjectMeta: metav1.ObjectMeta{
			Name: deployment.Name,
		},
		Spec: corev1.ServiceSpec{
			Ports:    ports,
			Selector: selector,
			Type:     corev1.ServiceTypeClusterIP,
		},
	}
}

func (r *Resolver) encodeObjects(objs []runtime.Object) (string, error) {
	s := json.NewYAMLSerializer(json.DefaultMetaFactory, scheme.Scheme,
		scheme.Scheme)

	buf := bytes.NewBufferString("")

	for _, obj := range objs {

		// Encode the object to YAML.
		err := s.Encode(obj, buf)
		if err != nil {
			return "", err
		}

		buf.WriteString("---\n")

	}

	return buf.String(), nil
}
