# infrastructure

Initialization:

```bash
sudo mount --make-shared /  # Only for WSL users

sudo ufw disable

./init.sh

k3s kubectl apply -f ./manifests
```

To access grafana:

```bash
k3s kubectl port-forward -n observability deployment/kube-prometheus-stack-grafana 3000
```

Default grafana username is `admin` and password is `prom-operator`.

Cleanup completed pods:

```bash
k3s kubectl delete pod --field-selector=status.phase==Succeeded -A
```
