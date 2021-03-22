#!/bin/bash
UNAMECHK=`uname`
KIND_PATH="/usr/local/bin"
EXTERNAL_IP=""
KIND_FILE=$(which kind)

sp="/-\|"
sc=0
spin() {
  printf "\b${sp:sc++:1}"
  ((sc==${#sp})) && sc=0
}
endspin() {
  printf "\r%s\n" "$@"
}

#Host IP Check
if [[ $EXTERNAL_IP == "" ]]; then
	if [[ $UNAMECHK == "Darwin" ]]; then
		EXTERNAL_IP=$(ifconfig | grep "inet " | grep -v  "127.0.0.1" | awk -F " " '{print $2}'|head -n1)
    # echo $EXTERNAL_IP
	else
		EXTERNAL_IP=$(ip a | grep "inet " | grep -v  "127.0.0.1" | awk -F " " '{print $2}'|awk -F "/" '{print $1}'|head -n1)
    # echo $EXTERNAL_IP
	fi
fi

if [[ -f "$KIND_FILE" ]]; then
  echo "$KIND_FILE exists."
else
  echo "Downloading kind"
  curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.10.0/kind-$UNAMECHK-amd64"
  chmod +x ./kind
  echo "Checking sudo access"
  sudo mv ./kind $KIND_PATH/kind
fi

cp cluster-config.yml external_ip.yml

sed -i 's/127.0.0.1/'$EXTERNAL_IP'/g' external_ip.yml

kind create cluster --image=kindest/node:v1.20.2 --config external_ip.yml

rm external_ip.yml

# Check Cluster Ready
echo "Starting K3d Cluster"
until [[ $(kubectl get pods -A -o jsonpath='{range .items[*]}{.status.conditions[?(@.type=="Ready")].status}{"\t"}{.status.containerStatuses[*].name}{"\n"}{end}' | grep -v True ) = '' ]]; do 
  spin
done
endspin

kubectl cluster-info --context kind-kind

echo "All Resources Ready State!"