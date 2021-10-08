#!/bin/bash

script_dirname=/opt/qemu-k3s
k3sreadylock="/workspace/k3s-ready.lock"

if test -f "${k3sreadylock}"; then
    exit 0
fi

echo "🔥 Installing Argo Workflows into local K3S cluster.."
kubectl create namespace argo
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.1.13/install.yaml

kubectl create rolebinding default-admin --clusterrole=admin --serviceaccount=argo:default -n argo
echo "✅ Argo WF installation completed."
