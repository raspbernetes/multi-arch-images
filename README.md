# Container Images

<a href="https://app.fossa.com/projects/git%2Bgithub.com%2Fraspbernetes%2Fmulti-arch-images?ref=badge_shield" alt="FOSSA Status"><img src="https://app.fossa.com/api/projects/git%2Bgithub.com%2Fraspbernetes%2Fmulti-arch-images.svg?type=shield"/></a>

This repository is only used to store the unofficial docker images that will be compatible with non supported architectures. Once there is official support from the upstream maintainers it is anticipated that these will become deprecated.
****

## Available Images

| Name                                                                                   | Architecture      | Upstream Issue                                                                                                                                                                               |
| -------------------------------------------------------------------------------------- | ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [apcupsd-exporter](https://hub.docker.com/r/raspbernetes/apcupsd-exporter)             | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |
| [botkube](https://hub.docker.com/r/raspbernetes/botkube)                               | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |
| [cluster-autoscaler](https://hub.docker.com/r/raspbernetes/cluster-autoscaler)         | `arm64/amd64`     | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes/autoscaler/3392)](https://github.com/banzaicloud/pipeline/issues/3392)                                  |
| [descheduler](https://hub.docker.com/r/raspbernetes/descheduler)                       | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |
| [dex-k8s-authenticator](https://hub.docker.com/r/raspbernetes/dex-k8s-authenticator)   | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |
| [flagger](https://hub.docker.com/r/raspbernetes/flagger)                               | `arm64`           | N/A                                                                                                                                                                                          |
| [flux](https://hub.docker.com/r/raspbernetes/flux)                                     | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/flux/1761)](https://github.com/fluxcd/flux/issues/1761)                                                     |
| [helm-operator](https://hub.docker.com/r/raspbernetes/helm-operator)                   | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/fluxcd/helm-operator/147)](https://github.com/fluxcd/helm-operator/issues/147)                                     |
| [kube-bench](https://hub.docker.com/r/raspbernetes/kube-bench)                         | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |
| [kubeyaml](https://hub.docker.com/r/raspbernetes/kubeyaml)                             | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |
| [kured](https://hub.docker.com/r/raspbernetes/kured)                                   | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |
| [node-feature-discovery](https://hub.docker.com/r/raspbernetes/node-feature-discovery) | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-sigs/node-feature-discovery/426)](https://github.com/kubernetes-sigs/node-feature-discovery/issues/426) |
| [sops](https://hub.docker.com/r/raspbernetes/sops)                                     | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/mozilla/sops/595)](https://github.com/mozilla/sops/issues/595)                                                     |
| [thanos](https://hub.docker.com/r/raspbernetes/thanos)                                 | `arm64/amd64`     | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/thanos-io/thanos/1851)](https://github.com/thanos-io/thanos/issues/1851)                                           |
| [traefik-forward-auth](https://hub.docker.com/r/raspbernetes/traefik-forward-auth)     | `arm64/amd64`     | N/A                                                                                                                                                                                          |
| [velero-aws-plugin](https://hub.docker.com/r/raspbernetes/velero-aws-plugin)           | `arm/arm64/amd64` | [![GitHub issue status](https://img.shields.io/github/issues/detail/state/vmware-tanzu/velero-plugin-for-aws/18)](https://github.com/vmware-tanzu/velero-plugin-for-aws/issues/18)           |
| [velero-csi-plugin](https://hub.docker.com/r/raspbernetes/velero-csi-plugin)           | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |
| [velero-gcp-plugin](https://hub.docker.com/r/raspbernetes/velero-gcp-plugin)           | `arm/arm64/amd64` | N/A                                                                                                                                                                                          |

<!--
| csi-external-attacher                                                      | raspbernetes/csi-external-attacher)](https://hub.docker.com/r/raspbernetes/csi-external-attacher)         | `arm/arm64/amd64` |        [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/external-attacher/224)](https://github.com/kubernetes-csi/external-attacher/pull/224)        |
| csi-external-provisioner                                                   | raspbernetes/csi-external-provisioner)](https://hub.docker.com/r/raspbernetes/csi-external-provisioner)   | `arm/arm64/amd64` |    [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/external-provisioner/381)](https://github.com/kubernetes-csi/external-provisioner/issues/381)    |
| csi-external-resizer                                                       | raspbernetes/csi-external-resizer)](https://hub.docker.com/r/raspbernetes/csi-external-resizer)           | `arm/arm64/amd64` |                                                                                             N/A                                                                                              |
| csi-external-snapshotter                                                   | raspbernetes/csi-external-snapshotter)](https://hub.docker.com/r/raspbernetes/csi-external-snapshotter)   | `arm/arm64/amd64` |                                                                                             N/A                                                                                              |
| csi-node-driver-registrar                                                  | raspbernetes/csi-node-driver-registrar)](https://hub.docker.com/r/raspbernetes/csi-node-driver-registrar) | `arm/arm64/amd64` |    [![GitHub issue status](https://img.shields.io/github/issues/detail/state/kubernetes-csi/node-driver-registrar/48)](https://github.com/kubernetes-csi/node-driver-registrar/issues/48)    | -->

## Upstream Image Support

> _**Note:** These are images that we used to support but now have official support from the upstream developers. Updates are no longer released by Raspbernetes._

| Name                                                                                           | Since version    |
| ---------------------------------------------------------------------------------------------- | ---------------- |
| [ceph-csi](https://quay.io/cephcsi/cephcsi)                                                    | `3.0.0`          |
| [cloudflared](https://github.com/cloudflare/cloudflared/releases)                              | `2020.8.0`       |
| cstor-pool-arm64                                                                               | `1.11.0`         |
| [curl](https://hub.docker.com/r/curlimages/curl/tags?page=1&ordering=last_updated&name=7.70.0) | `7.70.0`         |
| [dex](https://hub.docker.com/r/dexidp/dex/tags)                                                | `v2.26.0`        |
| [external-dns](https://hub.docker.com/r/bitnami/external-dns/tags)                             | `0.7.5`          |
| gatekeeper                                                                                     | `v3.1.0-beta.11` |
| [ghostunnel](https://hub.docker.com/r/ghostunnel/ghostunnel/tags)                              | `v1.5.3`         |
| [kiali](https://quay.io/repository/kiali/kiali?tab=tags)                                       | `v1.28.0`        |
| [kube-state-metrics](k8s.gcr.io/kube-state-metrics/kube-state-metrics:v2.0.0-alpha.3)          | `v2.0.0-alpha.3` |
| [kustomize](https://github.com/kubernetes-sigs/kustomize/releases/tag/kustomize%2Fv4.0.5)      | `v4.0.5`         |
| pihole-exporter                                                                                | `0.0.9`          |
| prometheus-operator                                                                            | `v0.39.0`        |
| [sealed-secrets](https://quay.io/repository/bitnami/sealed-secrets-controller?tab=tags)        | `v0.10.0`        |
| k8s-sidecar                                                                                    | `0.1.193`        |
| **[DEPRECATED]** flux                                                                          | `1.22.1`         |
| **[DEPRECATED]** helm-operator                                                                 | `v1.2.03`        |

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
