# Application mono-repo using Bazel

This repo replicates a simple e2e service using multiple micro-services. The services communicates with each other using gRPC and istiod is responsible for propagating traffic routing configuration and service discovery information.

The purpose of this repo is:

* evaluate a client and server generation tooling
* evaluate a standard communication protocol between multiple services
* evaluate a building tool capable of building multiple languages

## How to use it

1. (Optional) Create the VM if you are on MacOSX. I used lima, but feel free to use any other tool. The scripts included already bootstrap a k8s cluster and the remaining of the doc assumes that cluster is already in place and configured:

Create the VM and connect to it:

```
$ envsubst < tools/k8s/lima-dev.yaml | limactl start --name=k8s -
$ limactl shell k8s
```

Inside the VM, configure kubectl:

```
$ mkdir ~/.kube
$ sudo cat /etc/kubernetes/admin.conf > ~/.kube/config
```

2. Install Istio in the cluster:
```
$ cd <project>
$ bazelisk run //tools/istio:install-istio-operator
$ bazelisk run //tools/istio:default.apply
```

3. Install ArgoCD
```
$ cd <project>
$ bazelisk run //tools/argocd:deploy.apply
```
4. Start all services in K8s
```
$ cd <project>
$ bazelisk run //services/k8s:base.apply
$ bazelisk run //services/detail/k8s:release.apply
$ bazelisk run //services/rating/k8s:release.apply
$ bazelisk run //services/review/k8s:release.apply
$ bazelisk run //services/product/k8s:release.apply
```

## Testing the services

The product services enables the [grpc-gateway](https://github.com/grpc-ecosystem/grpc-gateway) which is able to translate HTTP calls to GRPC. Given that, it is possible to use curl to request a product from the product service.

On one terminal, allow communication with the pod:
```
$ kubectl port-forward -n services services/product 8080:8080
```
On another terminal, make the request:
```
$ curl http://localhost:8080/v1/product/123 | jq . | less
```

At the moment, all data is hardcoded, so, please be patient. This is a personal project in which I can only work on my spare time.

## Improvements

* There is no dev experience like auto-completion and other tooling to help productivity
* Python bindings for gRPC does not support the xDS client (it uses the gRPC C library, so I suspect it is a binding issue)
