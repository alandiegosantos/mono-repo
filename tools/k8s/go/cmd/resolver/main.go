package main

import (
	"flag"
	"fmt"
	"log"
	"os"

	"github.com/alandiegosantos/monorepo/tools/k8s/go/pkg/resolver"
)

func main() {
	flagset := flag.NewFlagSet(os.Args[0], flag.ExitOnError)
	flags := resolver.RegisterFlags(flagset)
	flagset.Parse(os.Args[1:])

	r := resolver.NewResolver(flags)
	resolved, err := r.Resolve()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(resolved)
}
