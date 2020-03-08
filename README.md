# Multi Architecture Docker Images

This repostiory is only used to store the unofficial docker images that will be compatible with non supported architectures. Once there is official support from the upstream maintainers it is anticipated that these will become deprecated.

## Available Images

| Name | Image | Architecture | Issue |
|------|-------|--------------|-------|
| Sealed Secrets | [raspbernetes/sealed-secrets](https://hub.docker.com/repository/docker/raspbernetes/sealed-secrets) | arm/arm64/amd64 | [issue ref](https://github.com/open-policy-agent/gatekeeper/issues/496)|
| Gatekeeper | [raspbernetes/gatekeeper](https://hub.docker.com/repository/docker/raspbernetes/gatekeeper) | arm/arm64/amd64 | [issue ref](https://github.com/bitnami-labs/sealed-secrets/issues/360)|
| Sops | [raspbernetes/sops](https://hub.docker.com/repository/docker/raspbernetes/sops) | arm/arm64/amd64 | N/A|
| Kustomize | [raspbernetes/kustomize](https://hub.docker.com/repository/docker/raspbernetes/kustomize) | arm/arm64/amd64 | N/A|
| flux | [raspbernetes/flux](https://hub.docker.com/repository/docker/raspbernetes/flux) | arm/arm64/amd64 | N/A|
| fluxd | [raspbernetes/fluxd](https://hub.docker.com/repository/docker/raspbernetes/fluxd) | arm/arm64/amd64 | N/A|
| velero-aws-plugin | [raspbernetes/velero-aws-plugin](https://hub.docker.com/repository/docker/raspbernetes/velero-aws-plugin) | arm/arm64/amd64 | N/A|
| Pihole-Exporter | [raspbernetes/pihole-exporter](https://hub.docker.com/repository/docker/raspbernetes/pihole-exporter) | arm/arm64/amd64 | N/A|

## Future Images

| Name | Issue |
|------|-------|
| Istio | [issue ref](https://github.com/istio/istio/issues/21094) |
| Helm-Operator | N/A |
| Kured | N/A |
