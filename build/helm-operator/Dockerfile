FROM golang:1.15-alpine as build

ARG VERSION=1.0.0-rc9
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache ca-certificates 'git>=2.12.0' curl bash

WORKDIR /go/src/github.com/fluxcd/helm-operator

SHELL ["/bin/bash", "-c"]

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    git clone --depth 1 -b ${VERSION} https://github.com/fluxcd/helm-operator.git . && \
    export HELM2_VERSION=$(echo "$(cut -d'=' -f2 <<< $(grep HELM2_VERSION ./docker/helm2.version))") && \
    export HELM3_VERSION=$(echo "$(cut -d'=' -f2 <<< $(grep HELM3_VERSION ./docker/helm3.version))") && \
    export KUBECTL_VERSION=$(echo "$(cut -d'=' -f2 <<< $(grep KUBECTL_VERSION ./docker/kubectl.version))") && \
    echo "HELM2_VERSION=${HELM2_VERSION}" && \
    echo "HELM3_VERSION=${HELM3_VERSION}" && \
    echo "KUBECTL_VERSION=${KUBECTL_VERSION}" && \
    curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/${GOARCH}/kubectl" && \
    curl -L -o /tmp/helm-v${HELM2_VERSION}-linux-${GOARCH}.tar.gz "https://get.helm.sh/helm-v${HELM2_VERSION}-linux-${GOARCH}.tar.gz" && \
    tar -xvf /tmp/helm-v${HELM2_VERSION}-linux-${GOARCH}.tar.gz -C /tmp && \
    mv /tmp/linux-${GOARCH}/helm /usr/bin/helm2 && \
    rm -rf /tmp/* && \
    curl -L -o /tmp/helm-v${HELM3_VERSION}-linux-${GOARCH}.tar.gz "https://get.helm.sh/helm-v${HELM3_VERSION}-linux-${GOARCH}.tar.gz" && \
    tar -xvf /tmp/helm-v${HELM3_VERSION}-linux-${GOARCH}.tar.gz -C /tmp && \
    mv /tmp/linux-${GOARCH}/helm /usr/bin/helm3 && \
    go build -o helm-operator ./cmd/helm-operator

FROM alpine:3.12

ENV HELM_HOME=/var/fluxd/helm

WORKDIR /home/flux

RUN apk add --no-cache openssh-client ca-certificates tini 'git>=2.12.0' socat curl bash

RUN mkdir -p /var/fluxd/helm/repository/cache/

COPY --from=build /go/src/github.com/fluxcd/helm-operator/docker/helm-repositories.yaml /var/fluxd/helm/repository/repositories.yaml
COPY --from=build /go/src/github.com/fluxcd/helm-operator/docker/ssh_config /etc/ssh/ssh_config
COPY --from=build /go/src/github.com/fluxcd/helm-operator/docker/known_hosts.sh /home/flux/known_hosts.sh
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
