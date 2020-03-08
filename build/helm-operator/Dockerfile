FROM golang:1.13-alpine as build

ARG VERSION=1.0.0-rc9
ARG KUBECTL_VERSION=v1.15.7
ARG HELM_VERSION=v2.16.1
ARG HELM3_VERSION=v3.1.1
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache ca-certificates 'git>=2.12.0' curl

ADD https://raw.githubusercontent.com/fluxcd/helm-operator/${VERSION}/docker/known_hosts.sh /known_hosts.sh
ADD https://raw.githubusercontent.com/fluxcd/helm-operator/${VERSION}/docker/ssh_config /ssh_config
ADD https://raw.githubusercontent.com/fluxcd/helm-operator/${VERSION}/docker/helm-repositories.yaml /helm-repositories.yaml

WORKDIR /go/src/github.com/fluxcd/helm-operator

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/${GOARCH}/kubectl" && \
    curl -L -o /tmp/helm-${HELM_VERSION}-linux-${GOARCH}.tar.gz "https://get.helm.sh/helm-${HELM_VERSION}-linux-${GOARCH}.tar.gz" && \
    tar -xvf /tmp/helm-${HELM_VERSION}-linux-${GOARCH}.tar.gz -C /tmp && \
    mv /tmp/linux-${GOARCH}/helm /usr/bin/helm2 && \
    chmod +x /usr/bin/helm2 && \
    curl -L -o /tmp/helm-${HELM3_VERSION}-linux-${GOARCH}.tar.gz "https://get.helm.sh/helm-${HELM3_VERSION}-linux-${GOARCH}.tar.gz" && \
    tar -xvf /tmp/helm-${HELM3_VERSION}-linux-${GOARCH}.tar.gz -C /tmp && \
    mv /tmp/linux-${GOARCH}/helm /usr/bin/helm3 && \
    chmod +x /usr/bin/helm3 && \
    git clone --depth 1 -b ${VERSION} https://github.com/fluxcd/helm-operator.git . && \
    go build -o helm-operator ./cmd/helm-operator

FROM alpine:3.10

ENV HELM_HOME=/var/fluxd/helm

WORKDIR /home/flux

RUN apk add --no-cache openssh-client ca-certificates tini 'git>=2.12.0' socat curl bash

RUN mkdir -p /var/fluxd/helm/repository/cache/

COPY --from=build /helm-repositories.yaml /var/fluxd/helm/repository/repositories.yaml
COPY --from=build /ssh_config /etc/ssh/ssh_config
COPY --from=build /known_hosts.sh /home/flux/known_hosts.sh
RUN chmod +x /home/flux/known_hosts.sh \
    && sh /home/flux/known_hosts.sh /etc/ssh/ssh_known_hosts \
    && rm -f /home/flux/known_hosts.sh

COPY --from=build /go/src/github.com/fluxcd/helm-operator/helm-operator /usr/bin/helm-operator
RUN chmod +x /usr/bin/helm-operator

COPY --from=build /usr/bin/helm2 /usr/bin/helm2
RUN chmod +x /usr/bin/helm2

COPY --from=build /usr/bin/helm3 /usr/bin/helm3
RUN chmod +x /usr/bin/helm3

COPY --from=build /usr/bin/kubectl /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl

ENTRYPOINT ["/sbin/tini", "--", "helm-operator"]
