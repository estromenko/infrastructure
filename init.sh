#!/bin/sh

set -x

sudo mkdir -p /var/lib/rancher/k3s/server/manifests

# Calico CNI
sudo wget -O /var/lib/rancher/k3s/server/manifests/calico-custom-resources.yaml \
    https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/custom-resources.yaml

sudo wget -O /var/lib/rancher/k3s/server/manifests/calico-tigera-operator.yaml \
    https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/tigera-operator.yaml

# Nginx Ingress Controller
sudo wget -O /var/lib/rancher/k3s/server/manifests/nginx-ingress-controller.yaml \
    https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml

# K3s Cluster
curl -sfL https://raw.githubusercontent.com/k3s-io/k3s/v1.29.5+k3s1/install.sh | \
    INSTALL_K3S_VERSION="v1.29.5+k3s1" \
    K3S_KUBECONFIG_MODE="644" \
    K3S_HOSTNAME="$(hostname)" \
    INSTALL_K3S_EXEC="--cluster-init --embedded-registry --secrets-encryption --flannel-backend=none --cluster-cidr=192.168.0.0/16 --disable-network-policy --disable=traefik" \
    sh -
