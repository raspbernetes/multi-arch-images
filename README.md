# Multi Architecture Docker Images

This repository is only used to store the unofficial docker images that will be compatible with non supported architectures. Once there is official support from the upstream maintainers it is anticipated that these will become deprecated.

## Available Images

| Name | Docker Image | Architecture | Upstream Issue |
|------|--------------|--------------|----------------|
| gatekeeper | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/gatekeeper)](https://hub.docker.com/r/raspbernetes/gatekeeper) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/open-policy-agent/gatekeeper/496)](https://github.com/open-policy-agent/gatekeeper/issues/496)|
| sops | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/sops)](https://hub.docker.com/r/raspbernetes/sops) | `arm/arm64/amd64` | N/A|
| kustomize | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kustomize)](https://hub.docker.com/r/raspbernetes/kustomize) | `arm/arm64/amd64` | N/A|
| flux | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/flux)](https://hub.docker.com/r/raspbernetes/flux) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/flux/1761)](https://github.com/fluxcd/flux/issues/1761)|
| fluxd | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/fluxd)](https://hub.docker.com/r/raspbernetes/fluxd) | `arm/arm64/amd64` | N/A|
| velero-aws-plugin | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/velero-aws-plugin)](https://hub.docker.com/r/raspbernetes/velero-aws-plugin) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/vmware-tanzu/velero-plugin-for-aws/18)](https://github.com/vmware-tanzu/velero-plugin-for-aws/issues/18)|
| pihole-exporter | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/pihole-exporter)](https://hub.docker.com/r/raspbernetes/pihole-exporter) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/eko/pihole-exporter/13)](https://github.com/eko/pihole-exporter/issues/13)|
| kured | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kured)](https://hub.docker.com/r/raspbernetes/kured) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/weaveworks/kured/23)](https://github.com/weaveworks/kured/issues/23)|
| helm-operator | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/helm-operator)](https://hub.docker.com/r/raspbernetes/helm-operator) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/helm-operator/147)](https://github.com/fluxcd/helm-operator/issues/147)|

## Future Images

> _**Note:** These are images that we would like to support in the future, if you have time feel free to open a PR._

| Name | Issue |
|------|-------|
| istio | [issue ref](https://github.com/istio/istio/issues/21094) |

## Deprecated Images

> _**Note:** These are images that we used to support but now have official support from the upstream developers._

| Name | Since version | Upstream Issue |
|------|---------------|----------------|
| sealed secrets | `v0.10.0` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/bitnami-labs/sealed-secrets/360)](https://github.com/bitnami-labs/sealed-secrets/issues/360)|
