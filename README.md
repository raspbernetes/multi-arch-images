# Multi Architecture Docker Images

This repostiory is only used to store the unofficial docker images that will be compatible with non supported architectures. Once there is official support from the upstream maintainers it is anticipated that these will become deprecated.

## Available Images

| Name | Image | Architecture | Issue |
|------|-------|--------------|-------|
| Sealed Secrets | [xunholy/sealed-secrets](https://hub.docker.com/repository/docker/xunholy/sealed-secrets) | arm/arm64/amd64 | [issue ref](https://github.com/open-policy-agent/gatekeeper/issues/496)|
| Gatekeeper | [xunholy/gatekeeper](https://hub.docker.com/repository/docker/xunholy/gatekeeper) | arm/arm64/amd64 | [issue ref](https://github.com/bitnami-labs/sealed-secrets/issues/360)|
| Sops | [xunholy/sops](https://hub.docker.com/repository/docker/xunholy/sops) | arm/arm64/amd64 | N/A|
| Kustomize | [xunholy/kustomize](https://hub.docker.com/repository/docker/xunholy/kustomize) | arm/arm64/amd64 | N/A|
| flux | [xunholy/flux](https://hub.docker.com/repository/docker/xunholy/flux) | arm/arm64/amd64 | N/A|
| fluxd | [xunholy/fluxd](https://hub.docker.com/repository/docker/xunholy/fluxd) | arm/arm64/amd64 | N/A|
| velero-aws-plugin | [xunholy/velero-aws-plugin](https://hub.docker.com/repository/docker/xunholy/velero-aws-plugin) | arm/arm64/amd64 | N/A|

## Future Images

| Name | Issue |
|------|-------|
| Istio | [issue ref](https://github.com/istio/istio/issues/21094) |
| Helm-Operator | N/A |
| Kured | N/A |
| Pihole-Exporter | N/A |
