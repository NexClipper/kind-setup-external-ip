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
 â Ensuring node image (kindest/node:v1.20.2) đŧ
 â Preparing nodes đĻ đĻ đĻ
 â Writing configuration đ
 â Starting control-plane đšī¸
 â Installing CNI đ
 â Installing StorageClass đž
 â Joining worker nodes đ
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Thanks for using kind! đ
Starting K3d Cluster
-
Kubernetes control plane is running at https://192.168.15.88:6443
KubeDNS is running at https://192.168.15.88:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
All Resources Ready State!
```


## Delete Cluster
```sh
$ kind delete cluster --name kind
```