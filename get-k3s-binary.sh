#!/bin/sh

curl -sfL https://raw.githubusercontent.com/k3s-io/k3s/v1.29.5+k3s1/install.sh | INSTALL_K3S_SKIP_ENABLE=true
