# Application mono-repo using Bazel

This repo replicates a simple e2e service using multiple micro-services. The services communicates with each other using gRPC and istiod is responsible for propagating traffic routing configuration and service discovery information.

The purpose of this repo is:

* evaluate a client and server generation tooling
* evaluate a standard communication protocol between multiple services
* evaluate a building tool capable of building multiple languages

## How to use it

1. Create the VM if you are on MacOSX. I used lima, but feel free to use any other tool. The scripts included already bootstrap a k8s cluster and the remaining of the doc assumes that cluster is already in place and configured:

Create the VM and connect to it:

```
$ cat tools/k8s/lima.yaml | sed -e "s|<project>|$PWD|g" | limactl start --name=k8s -
$ limactl shell k8s
```

Inside the VM, configure kubectl:

```
$ sudo rm -rf ~/.kube && mkdir ~/.kube
$ sudo cat /etc/kubernetes/admin.conf > ~/.kube/config
```

2. Install Istio in the cluster:
```
$ cd <project>
$ bazelisk run //tools/istio:install-istio-operator
$ bazelisk run //tools/istio:default.apply
```

3. Start the local registry:
```
$ cd <project>
$ bazelisk run //tools/registry:deploy.apply
```

3. Install ArgoCD (optional)
```
$ cd <project>
$ bazelisk run //tools/argocd:deploy.apply
```
4. Start all services in K8s
* If you decided to proceed without argocd
```
$ cd <project>
$ bazelisk run //services/k8s:base.apply
$ bazelisk run //services/detail/k8s:release.apply
$ bazelisk run //services/rating/k8s:release.apply
$ bazelisk run //services/review/k8s:release.apply
$ bazelisk run //services/product/k8s:release.apply
```
* If you decided to proceed with argocd
```
$ cd <project>
$ bazelisk run //services/k8s:base.apply
$ bazelisk run //services/rating/k8s:release.apply # there is a problem when building the python services on the argocd buid node
$ for target in $(bazelisk query //services/... | grep register_argocd.apply); do bazelisk run $target; done # register other services in argocd
```

## Checking the deploy on ArgoCD
The first build inside the ArgoCD Repo Server takes time (~ 30 minutes). To see it happening, you can forward traffic using ssh and kubectl:
If you are using lima VMs, you can redirect the requests to port 8080 to inside the VM:
```
$ ssh -L 8080:localhost:8080 -o Hostname=127.0.0.1 -o Port=$(limactl list --format json | jq '. | select(.name=="k8s") | .sshLocalPort') lima-k8s
$ kubectl port-forward svc/argocd-server -n argocd 8080:443
```
To get the initial argocd password:
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
Then, go to 'localhost:8080' and use the username _admin_ and the _password_ fetched above.

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
* The Certificates Authorities in the containers are copied from the build nodes. The scalable solution requires a external service for this.
* Rating service fails if it is build inside the bazel-plugin container. Pending investigation of the root cause.
