ARG GOOS
ARG GOARCH

## Build Fluxd
FROM golang:1.13-alpine as fluxd

ARG FLUX_VERSION

WORKDIR /go/src/github.com/fluxcd/flux

RUN apk add --no-cache git && \
    git clone --depth 1 -b ${FLUX_VERSION} https://github.com/fluxcd/flux.git . && \
    CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} GO111MODULE=on go build -o fluxd ./cmd/fluxd

## Build Kustomize
FROM golang:1.13-alpine as kustomize

ARG KUSTOMIZE_VERSION

WORKDIR /go/src/github.com/kubernetes-sigs/kustomize

RUN apk add --no-cache git && \
    git clone --depth 1 -b kustomize/${KUSTOMIZE_VERSION} https://github.com/kubernetes-sigs/kustomize.git . && \
    cd ./kustomize && \
    CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} GO111MODULE=on go build -o kustomize .

## Build Sops
FROM golang:1.13-alpine as sops

ARG SOPS_VERSION

WORKDIR /go/src/github.com/mozilla/sops

RUN apk add --no-cache git && \
    git clone --depth 1 -b ${SOPS_VERSION} https://github.com/mozilla/sops.git . && \
    CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} GO111MODULE=on go build -o sops ./cmd/sops

# Final Image
FROM alpine:3.10

ARG KUBECTL_VERSION

WORKDIR /home/flux

RUN apk add --no-cache openssh-client curl ca-certificates tini git gnutls gnupg gawk socat && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing git-secret

RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf
COPY ./kubeconfig /root/.kube/config

COPY ./known_hosts.sh /home/flux/known_hosts.sh
RUN chmod +x /home/flux/known_hosts.sh && \
    sh /home/flux/known_hosts.sh /etc/ssh/ssh_known_hosts && \
    rm /home/flux/known_hosts.sh

# Add default SSH config, which points at the private key we'll mount
COPY ./ssh_config /etc/ssh/ssh_config

RUN curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/${GOARCH}/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl -L -o /usr/local/bin/fluxctl https://github.com/fluxcd/flux/releases/download/${FLUX_VERSION}/fluxctl_linux_${GOARCH} && \
    chmod +x /usr/local/bin/fluxctl

COPY --from=fluxd /go/src/github.com/fluxcd/flux/fluxd /usr/local/bin/fluxd
RUN chmod +x /usr/local/bin/fluxd

COPY --from=kustomize /go/src/github.com/kubernetes-sigs/kustomize/kustomize/kustomize /usr/local/bin/kustomize
RUN chmod +x /usr/local/bin/kustomize

COPY --from=sops /go/src/github.com/mozilla/sops/sops /usr/local/bin/sops
RUN chmod +x /usr/local/bin/sops

COPY --from=quay.io/squaremo/kubeyaml:0.7.0 /usr/lib/kubeyaml /usr/lib/kubeyaml/
ENV PATH=/bin:/usr/bin:/usr/local/bin:/usr/lib/kubeyaml

ENTRYPOINT ["/sbin/tini", "--", "fluxd"]
