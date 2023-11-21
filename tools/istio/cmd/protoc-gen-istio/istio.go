package main

import (
	"bytes"
	"fmt"
	"strings"

	"google.golang.org/protobuf/compiler/protogen"
	networkingv1beta1 "istio.io/api/networking/v1beta1"
	"istio.io/client-go/pkg/apis/networking/v1beta1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	kjson "k8s.io/apimachinery/pkg/runtime/serializer/json"
)

const baseRepoName string = "github.com/alandiegosantos/monorepo"

func generateFile(gen *protogen.Plugin, file *protogen.File) *protogen.GeneratedFile {
	if len(file.Services) == 0 {
		return nil
	}
	filename := strings.TrimPrefix(file.GeneratedFilenamePrefix, baseRepoName) + "_istio.yaml"
	g := gen.NewGeneratedFile(filename, file.GoImportPath)
	objs := make([]runtime.Object, 0)
	objs = append(objs, &v1beta1.DestinationRule{
		TypeMeta: metav1.TypeMeta{
			Kind:       "DestinationRule",
			APIVersion: "networking.istio.io/v1alpha3",
		},
		ObjectMeta: metav1.ObjectMeta{
			Name: fmt.Sprintf("%s-dr", file.GoPackageName),
		},
		Spec: networkingv1beta1.DestinationRule{
			Host: "something",
		},
	})
	encoder := kjson.NewYAMLSerializer(kjson.DefaultMetaFactory, nil, nil)
	var buf bytes.Buffer

	for _, obj := range objs {
		if err := encoder.Encode(obj, &buf); err != nil {
			panic(err.Error())
		}
		g.P(buf.String())
		g.P("-----")
	}

	return g
}
