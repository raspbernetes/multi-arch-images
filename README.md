# Multi Architecture Docker Images

<a href="https://app.fossa.com/projects/git%2Bgithub.com%2Fraspbernetes%2Fmulti-arch-images?ref=badge_shield" alt="FOSSA Status"><img src="https://app.fossa.com/api/projects/git%2Bgithub.com%2Fraspbernetes%2Fmulti-arch-images.svg?type=shield"/></a>

This repository is only used to store the unofficial docker images that will be compatible with non supported architectures. Once there is official support from the upstream maintainers it is anticipated that these will become deprecated.

## Available Images

| Name | Docker Image | Architecture | Upstream Issue |
|------|--------------|--------------|----------------|
| apcupsd-exporter | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/apcupsd-exporter)](https://hub.docker.com/r/raspbernetes/apcupsd-exporter) | `arm/arm64/amd64` | N/A |
| cloudflared | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/cloudflared)](https://hub.docker.com/r/raspbernetes/cloudflared) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/cloudflare/cloudflared/140)](https://github.com/cloudflare/cloudflared/issues/140) |
| cluster-autoscaler | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/cluster-autoscaler)](https://hub.docker.com/r/raspbernetes/cluster-autoscaler) | `arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes/autoscaler/3419)](https://github.com/kubernetes/autoscaler/issues/3419) |
| csi-external-attacher | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-external-attacher)](https://hub.docker.com/r/raspbernetes/csi-external-attacher) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/external-attacher/224)](https://github.com/kubernetes-csi/external-attacher/pull/224) |
| csi-external-provisioner | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-external-provisioner)](https://hub.docker.com/r/raspbernetes/csi-external-provisioner) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/external-provisioner/381)](https://github.com/kubernetes-csi/external-provisioner/issues/381) |
| csi-external-resizer | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-external-resizer)](https://hub.docker.com/r/raspbernetes/csi-external-resizer) | `arm/arm64/amd64` | N/A |
| csi-external-snapshotter | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-external-snapshotter)](https://hub.docker.com/r/raspbernetes/csi-external-snapshotter) | `arm/arm64/amd64` | N/A |
| csi-node-driver-registrar | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-node-driver-registrar)](https://hub.docker.com/r/raspbernetes/csi-node-driver-registrar) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/node-driver-registrar/48)](https://github.com/kubernetes-csi/node-driver-registrar/issues/48) |
| dex-k8s-authenticator | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/dex-k8s-authenticator)](https://hub.docker.com/r/raspbernetes/dex-k8s-authenticator) | `arm/arm64/amd64` | N/A |
| flagger | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/flagger)](https://hub.docker.com/r/raspbernetes/flagger) | `arm64` | N/A |
| flux | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/flux)](https://hub.docker.com/r/raspbernetes/flux) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/flux/1761)](https://github.com/fluxcd/flux/issues/1761)|
| helm-operator | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/helm-operator)](https://hub.docker.com/r/raspbernetes/helm-operator) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/helm-operator/147)](https://github.com/fluxcd/helm-operator/issues/147)|
| kube-bench | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kube-bench)](https://hub.docker.com/r/raspbernetes/kube-bench) | `arm/arm64/amd64` | N/A |
| kube-state-metrics | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kube-state-metrics)](https://hub.docker.com/r/raspbernetes/kube-state-metrics) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes/kube-state-metrics/1037)](https://github.com/kubernetes/kube-state-metrics/issues/1037) |
| kubeyaml | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kubeyaml)](https://hub.docker.com/r/raspbernetes/kubeyaml) | `arm/arm64/amd64` | N/A |
| kured | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kured)](https://hub.docker.com/r/raspbernetes/kured) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/weaveworks/kured/23)](https://github.com/weaveworks/kured/issues/23)|
| kustomize | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kustomize)](https://hub.docker.com/r/raspbernetes/kustomize) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-sigs/kustomize/2235)](https://github.com/kubernetes-sigs/kustomize/issues/2235)|
| node-feature-discovery | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/node-feature-discovery)](https://hub.docker.com/r/raspbernetes/node-feature-discovery) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-sigs/node-feature-discovery/203)](https://github.com/kubernetes-sigs/node-feature-discovery/issues/203) |
| sops | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/sops)](https://hub.docker.com/r/raspbernetes/sops) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/mozilla/sops/595)](https://github.com/mozilla/sops/issues/595)|
| traefik-forward-auth | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/traefik-forward-auth)](https://hub.docker.com/r/raspbernetes/traefik-forward-auth) | `arm64/amd64` | N/A |
| velero-aws-plugin | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/velero-aws-plugin)](https://hub.docker.com/r/raspbernetes/velero-aws-plugin) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/vmware-tanzu/velero-plugin-for-aws/18)](https://github.com/vmware-tanzu/velero-plugin-for-aws/issues/18)|
| velero-gcp-plugin | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/velero-gcp-plugin)](https://hub.docker.com/r/raspbernetes/velero-gcp-plugin) | `arm/arm64/amd64` | N/A|

## Istio Images

| Name | Docker Image | Architecture | Upstream Issue |
|------|--------------|--------------|----------------|
| base | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/istio-base)](https://hub.docker.com/r/raspbernetes/istio-base) | `arm64/amd64` | N/A |
| envoy | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/istio-envoy)](https://hub.docker.com/r/raspbernetes/istio-envoy) | `arm64` | N/A |
| operator | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/istio-operator)](https://hub.docker.com/r/raspbernetes/istio-operator) | `arm64/amd64` | N/A |
| pilot | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/istio-pilot)](https://hub.docker.com/r/raspbernetes/istio-pilot) | `arm64` | N/A |
| proxyv2 | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/istio-proxyv2)](https://hub.docker.com/r/raspbernetes/istio-proxyv2) | `arm64` | N/A |

## Deprecated Images

> _**Note:** These are images that we used to support but now have official support from the upstream developers. Updates are no longer released by Raspbernetes._

| Name | Since version |
|------|---------------|
| [ceph-csi](https://quay.io/cephcsi/cephcsi) | `3.0.0` |
| cstor-pool-arm64 | `1.11.0` |
| curl | `7.70.0` |
| [dex](https://hub.docker.com/r/dexidp/dex/tags) | `v2.26.0` |
| [external-dns](https://hub.docker.com/r/bitnami/external-dns/tags) | `0.7.5` |
| gatekeeper | `v3.1.0-beta.11` |
| [ghostunnel](https://hub.docker.com/r/ghostunnel/ghostunnel/tags) | `v1.5.3` |
| pihole-exporter | `0.0.9` |
| prometheus-operator | `v0.39.0` |
| sealed secrets | `v0.10.0` |
| k8s-sidecar | `0.1.193` |

## Contributors

This project exists thanks to all the people who contribute.

<a href="https://github.com/raspbernetes/multi-arch-images/graphs/contributors"><img src="https://opencollective.com/raspbernetes/contributors.svg?width=890&button=false" /></a>

## Backers

Thank you to all our backers! 🙏 [[Become a backer](https://opencollective.com/raspbernetes#backer)]

<a href="https://opencollective.com/raspbernetes#backers" target="_blank"><img src="https://opencollective.com/raspbernetes/backers.svg"></a>

## Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website. [[Become a sponsor](https://opencollective.com/raspbernetes#sponsor)]

<a href="https://opencollective.com/raspbernetes/sponsor/0/website" target="_blank"><img src="https://opencollective.com/raspbernetes/sponsor/0/avatar.svg"></a> <a href="https://opencollective.com/raspbernetes/sponsor/1/website" target="_blank"><img src="https://opencollective.com/raspbernetes/sponsor/1/avatar.svg"></a>

## License

Raspbernetes is [Apache 2.0 licensed](./LICENSE).


[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fraspbernetes%2Fmulti-arch-images.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fraspbernetes%2Fmulti-arch-images?ref=badge_large)
