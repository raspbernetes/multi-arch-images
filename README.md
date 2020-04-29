# Multi Architecture Docker Images

This repository is only used to store the unofficial docker images that will be compatible with non supported architectures. Once there is official support from the upstream maintainers it is anticipated that these will become deprecated.

## Available Images

| Name | Docker Image | Architecture | Upstream Issue |
|------|--------------|--------------|----------------|
| gatekeeper | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/gatekeeper)](https://hub.docker.com/r/raspbernetes/gatekeeper) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/open-policy-agent/gatekeeper/496)](https://github.com/open-policy-agent/gatekeeper/issues/496)|
| sops | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/sops)](https://hub.docker.com/r/raspbernetes/sops) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/mozilla/sops/595)](https://github.com/mozilla/sops/issues/595)|
| kustomize | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kustomize)](https://hub.docker.com/r/raspbernetes/kustomize) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-sigs/kustomize/2235)](https://github.com/kubernetes-sigs/kustomize/issues/2235)|
| flux | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/flux)](https://hub.docker.com/r/raspbernetes/flux) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/flux/1761)](https://github.com/fluxcd/flux/issues/1761)|
| fluxd | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/fluxd)](https://hub.docker.com/r/raspbernetes/fluxd) | `arm/arm64/amd64` | N/A|
| velero-aws-plugin | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/velero-aws-plugin)](https://hub.docker.com/r/raspbernetes/velero-aws-plugin) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/vmware-tanzu/velero-plugin-for-aws/18)](https://github.com/vmware-tanzu/velero-plugin-for-aws/issues/18)|
| pihole-exporter | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/pihole-exporter)](https://hub.docker.com/r/raspbernetes/pihole-exporter) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/eko/pihole-exporter/13)](https://github.com/eko/pihole-exporter/issues/13)|
| apcupsd-exporter | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/apcupsd-exporter)](https://hub.docker.com/r/raspbernetes/apcupsd-exporter) | `arm/arm64/amd64` | N/A |
| kured | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kured)](https://hub.docker.com/r/raspbernetes/kured) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/weaveworks/kured/23)](https://github.com/weaveworks/kured/issues/23)|
| kubeyaml | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kubeyaml)](https://hub.docker.com/r/raspbernetes/kubeyaml) | `arm/arm64/amd64` | N/A |
| helm-operator | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/helm-operator)](https://hub.docker.com/r/raspbernetes/helm-operator) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/helm-operator/147)](https://github.com/fluxcd/helm-operator/issues/147)|
| prometheus-operator | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/prometheus-operator)](https://hub.docker.com/r/raspbernetes/prometheus-operator) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/coreos/prometheus-operator/2946)](https://github.com/coreos/prometheus-operator/issues/2946)|
| k8s-sidecar | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/k8s-sidecar)](https://hub.docker.com/r/raspbernetes/k8s-sidecar) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/kiwigrid/k8s-sidecar/48)](https://github.com/kiwigrid/k8s-sidecar/issues/48)|
| ghostunnel | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/ghostunnel)](https://hub.docker.com/r/raspbernetes/ghostunnel) | `arm/arm64/amd64` | N/A |

## Future Images

> _**Note:** These are images that we would like to support in the future, if you have time feel free to open a PR._

| Name | Upstream Issue |
|------|----------------|
| istio | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/istio/istio/21094)](https://github.com/istio/istio/issues/21094)|

## Deprecated Images

> _**Note:** These are images that we used to support but now have official support from the upstream developers._

| Name | Since version |
|------|---------------|
| sealed secrets | `v0.10.0` |
