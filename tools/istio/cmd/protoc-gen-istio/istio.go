package main

import (
	"google.golang.org/protobuf/compiler/protogen"
	"istio.io/client-go/pkg/apis/networking/v1beta1"
	"k8s.io/cli-runtime/pkg/printers"
)

func generateFile(gen *protogen.Plugin, file *protogen.File) *protogen.GeneratedFile {
	if len(file.Services) == 0 {
		return nil
	}
	filename := file.GeneratedFilenamePrefix + "_istio.yaml"
	g := gen.NewGeneratedFile(filename, file.GoImportPath)

	dr := &v1beta1.DestinationRule{}
	printer := printers.YAMLPrinter{}
	printer.PrintObj(dr, g)

	return g
}
