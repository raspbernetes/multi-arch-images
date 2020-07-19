# Multi Architecture Docker Images

This repository is only used to store the unofficial docker images that will be compatible with non supported architectures. Once there is official support from the upstream maintainers it is anticipated that these will become deprecated.

## Available Images

| Name | Docker Image | Architecture | Upstream Issue |
|------|--------------|--------------|----------------|
| apcupsd-exporter | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/apcupsd-exporter)](https://hub.docker.com/r/raspbernetes/apcupsd-exporter) | `arm/arm64/amd64` | N/A |
| cloudflared | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/cloudflared)](https://hub.docker.com/r/raspbernetes/cloudflared) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/cloudflare/cloudflared/140)](https://github.com/cloudflare/cloudflared/issues/140) |
| ceph-csi | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/ceph-csi)](https://hub.docker.com/r/raspbernetes/ceph-csi) | `arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/ceph/ceph-csi/1003)](https://github.com/ceph/ceph-csi/issues/1003) |
| csi-external-attacher | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-external-attacher)](https://hub.docker.com/r/raspbernetes/csi-external-attacher) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/external-attacher/224)](https://github.com/kubernetes-csi/external-attacher/pull/224) |
| csi-external-provisioner | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-external-provisioner)](https://hub.docker.com/r/raspbernetes/csi-external-provisioner) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/external-provisioner/381)](https://github.com/kubernetes-csi/external-provisioner/issues/381) |
| csi-external-resizer | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-external-resizer)](https://hub.docker.com/r/raspbernetes/csi-external-resizer) | `arm/arm64/amd64` | N/A |
| csi-external-snapshotter | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-external-snapshotter)](https://hub.docker.com/r/raspbernetes/csi-external-snapshotter) | `arm/arm64/amd64` | N/A |
| csi-node-driver-registrar | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/csi-node-driver-registrar)](https://hub.docker.com/r/raspbernetes/csi-node-driver-registrar) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/node-driver-registrar/48)](https://github.com/kubernetes-csi/node-driver-registrar/issues/48) |
| external-dns | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/external-dns)](https://hub.docker.com/r/raspbernetes/external-dns) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-sigs/external-dns/issues/1443)](https://github.com/kubernetes-sigs/external-dns/issues/1443) |
| flux | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/flux)](https://hub.docker.com/r/raspbernetes/flux) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/flux/1761)](https://github.com/fluxcd/flux/issues/1761)|
| gatekeeper | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/gatekeeper)](https://hub.docker.com/r/raspbernetes/gatekeeper) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/open-policy-agent/gatekeeper/496)](https://github.com/open-policy-agent/gatekeeper/issues/496)|
| ghostunnel | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/ghostunnel)](https://hub.docker.com/r/raspbernetes/ghostunnel) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/square/ghostunnel/260)](https://github.com/square/ghostunnel/issues/260) |
| helm-operator | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/helm-operator)](https://hub.docker.com/r/raspbernetes/helm-operator) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/helm-operator/147)](https://github.com/fluxcd/helm-operator/issues/147)|
| k8s-sidecar | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/k8s-sidecar)](https://hub.docker.com/r/raspbernetes/k8s-sidecar) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/kiwigrid/k8s-sidecar/48)](https://github.com/kiwigrid/k8s-sidecar/issues/48)|
| kube-bench | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kube-bench)](https://hub.docker.com/r/raspbernetes/kube-bench) | `arm/arm64/amd64` | N/A |
| kube-state-metrics | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kube-state-metrics)](https://hub.docker.com/r/raspbernetes/kube-state-metrics) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes/kube-state-metrics/1037)](https://github.com/kubernetes/kube-state-metrics/issues/1037) |
| kubeyaml | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kubeyaml)](https://hub.docker.com/r/raspbernetes/kubeyaml) | `arm/arm64/amd64` | N/A |
| kured | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kured)](https://hub.docker.com/r/raspbernetes/kured) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/weaveworks/kured/23)](https://github.com/weaveworks/kured/issues/23)|
| kustomize | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/kustomize)](https://hub.docker.com/r/raspbernetes/kustomize) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-sigs/kustomize/2235)](https://github.com/kubernetes-sigs/kustomize/issues/2235)|
| node-feature-discovery | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/node-feature-discovery)](https://hub.docker.com/r/raspbernetes/node-feature-discovery) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-sigs/node-feature-discovery/203)](https://github.com/kubernetes-sigs/node-feature-discovery/issues/203) |
| prometheus-operator | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/prometheus-operator)](https://hub.docker.com/r/raspbernetes/prometheus-operator) | `arm/arm64/amd64` |[![GitHub issue status](https://img.shields.io/github/issues/detail/state/coreos/prometheus-operator/2946)](https://github.com/coreos/prometheus-operator/issues/2946)|
| sops | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/sops)](https://hub.docker.com/r/raspbernetes/sops) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/mozilla/sops/595)](https://github.com/mozilla/sops/issues/595)|
| velero-aws-plugin | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/velero-aws-plugin)](https://hub.docker.com/r/raspbernetes/velero-aws-plugin) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/vmware-tanzu/velero-plugin-for-aws/18)](https://github.com/vmware-tanzu/velero-plugin-for-aws/issues/18)|
| velero-gcp-plugin | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/velero-gcp-plugin)](https://hub.docker.com/r/raspbernetes/velero-gcp-plugin) | `arm/arm64/amd64` | N/A|

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
| curl | `7.70.0` |
| pihole-exporter | `0.0.9` |

## Contributors

This project exists thanks to all the people who contribute.

<a href="https://github.com/raspbernetes/multi-arch-images/graphs/contributors"><img src="https://opencollective.com/raspbernetes/contributors.svg?width=890&button=false" /></a>
