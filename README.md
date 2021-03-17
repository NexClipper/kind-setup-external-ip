# kind-setup-external-ip
KinD clusters run in MacOS or Linux with External IP

## Communicate with kind
By default, KinD sets up the Kubernetes API server IP to be the local loopback address (127.0.0.1).  
Configure the KinD cluster to use an IP address that is already resolvable from your local machine.

So, You can test a scenario kind cluster to use an externel IP. 

## Using Script
```sh
./create.sh
/usr/local/bin/kind exists.
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.20.2) 🖼
 ✓ Preparing nodes 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Not sure what to do next? 😅  Check out https://kind.sigs.k8s.io/docs/user/quick-start/
Kubernetes control plane is running at https://192.168.15.88:6443
KubeDNS is running at https://192.168.15.88:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
All Resources Ready State!
```
