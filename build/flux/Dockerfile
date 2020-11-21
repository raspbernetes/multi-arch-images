ARG VERSION=1.19.0

FROM golang:1.15-alpine as build

ARG VERSION
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/fluxcd/flux

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    git clone --depth 1 -b ${VERSION} https://github.com/fluxcd/flux.git . && \
    go build -o fluxd -ldflags "-X main.version=${VERSION}" ./cmd/fluxd

FROM alpine:3.12

ARG VERSION
ARG TARGETPLATFORM

WORKDIR /home/flux

RUN apk add --no-cache openssh-client curl ca-certificates tini git gnutls gnupg gawk socat bash && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing git-secret

RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

ADD https://raw.githubusercontent.com/fluxcd/flux/${VERSION}/docker/kubectl.version /home/flux/kubectl.version
ADD https://raw.githubusercontent.com/fluxcd/flux/${VERSION}/docker/known_hosts.sh /home/flux/known_hosts.sh
ADD https://raw.githubusercontent.com/fluxcd/flux/${VERSION}/docker/ssh_config /etc/ssh/ssh_config
ADD https://raw.githubusercontent.com/fluxcd/flux/${VERSION}/docker/kubeconfig /root/.kube/config

RUN chmod +x /home/flux/known_hosts.sh && \
    sh /home/flux/known_hosts.sh /etc/ssh/ssh_known_hosts && \
    rm /home/flux/known_hosts.sh

SHELL ["/bin/bash", "-c"]

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export KUBECTL_VERSION=$(echo "$(cut -d'=' -f2 <<< $(grep KUBECTL_VERSION /home/flux/kubectl.version))") && \
    curl -L -o /usr/local/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/${GOARCH}/kubectl" && \
    chmod +x /usr/local/bin/kubectl && \
    curl -L -o /usr/local/bin/fluxctl "https://github.com/fluxcd/flux/releases/download/${VERSION}/fluxctl_linux_${GOARCH}" && \
    chmod +x /usr/local/bin/fluxctl

COPY --from=build /go/src/github.com/fluxcd/flux/fluxd /usr/local/bin/fluxd
RUN chmod +x /usr/local/bin/fluxd

# from: https://raw.githubusercontent.com/fluxcd/flux/${VERSION}/docker/kustomize.version
COPY --from=raspbernetes/kustomize:v3.8.4 /usr/local/bin/kustomize /usr/local/bin/kustomize
RUN chmod +x /usr/local/bin/kustomize

# from: https://raw.githubusercontent.com/fluxcd/flux/${VERSION}/docker/sops.version
COPY --from=raspbernetes/sops:v3.6.1 /usr/local/bin/sops /usr/local/bin/sops
RUN chmod +x /usr/local/bin/sops

COPY --from=raspbernetes/kubeyaml:0.7.0 /usr/lib/kubeyaml /usr/lib/kubeyaml/
ENV PATH=/bin:/usr/bin:/usr/local/bin:/usr/lib/kubeyaml

ENTRYPOINT ["/sbin/tini", "--", "fluxd"]
