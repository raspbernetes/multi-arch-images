# Multi Architecture Docker Images

This repostiory is only used to store the unofficial docker images that will be compatible with non supported architectures. Once there is official support from the upstream maintainers it is anticipated that these will become deprecated.

## Available Images

| Name | Image | Architecture | Issue |
|------|-------|--------------|-------|
| sealed Secrets | [raspbernetes/sealed-secrets](https://hub.docker.com/repository/docker/raspbernetes/sealed-secrets) | arm/arm64/amd64 | [issue ref](https://github.com/open-policy-agent/gatekeeper/issues/496)|
| gatekeeper | [raspbernetes/gatekeeper](https://hub.docker.com/repository/docker/raspbernetes/gatekeeper) | arm/arm64/amd64 | [issue ref](https://github.com/bitnami-labs/sealed-secrets/issues/360)|
| sops | [raspbernetes/sops](https://hub.docker.com/repository/docker/raspbernetes/sops) | arm/arm64/amd64 | N/A|
| kustomize | [raspbernetes/kustomize](https://hub.docker.com/repository/docker/raspbernetes/kustomize) | arm/arm64/amd64 | N/A|
| flux | [raspbernetes/flux](https://hub.docker.com/repository/docker/raspbernetes/flux) | arm/arm64/amd64 | [issue ref](https://github.com/fluxcd/flux/issues/1761)|
| fluxd | [raspbernetes/fluxd](https://hub.docker.com/repository/docker/raspbernetes/fluxd) | arm/arm64/amd64 | N/A|
| velero-aws-plugin | [raspbernetes/velero-aws-plugin](https://hub.docker.com/repository/docker/raspbernetes/velero-aws-plugin) | arm/arm64/amd64 | [issue ref](https://github.com/vmware-tanzu/velero-plugin-for-aws/issues/18)|
| pihole-Exporter | [raspbernetes/pihole-exporter](https://hub.docker.com/repository/docker/raspbernetes/pihole-exporter) | arm/arm64/amd64 | [issue ref](https://github.com/eko/pihole-exporter/issues/13)|
| kured | [raspbernetes/kured](https://hub.docker.com/repository/docker/raspbernetes/kured) | arm/arm64/amd64 |[issue ref](https://github.com/weaveworks/kured/issues/23)|

## Future Images

| Name | Issue |
|------|-------|
| istio | [issue ref](https://github.com/istio/istio/issues/21094) |
| helm-operator | N/A |
