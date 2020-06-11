FROM golang:1.13.5-alpine as builder

ARG VERSION=v0.6.0
ARG TARGETPLATFORM
ARG HOSTMOUNT_PREFIX

ENV GO111MODULE=on \
  CGO_ENABLED=0

WORKDIR /go/node-feature-discovery

RUN apk add git

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
  export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
  GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
  git clone --depth 1 -b ${VERSION} https://github.com/kubernetes-sigs/node-feature-discovery.git . && \
  go install \
  -ldflags "-s -w -X sigs.k8s.io/node-feature-discovery/pkg/version.version=$VERSION -X sigs.k8s.io/node-feature-discovery/source.pathPrefix=$HOSTMOUNT_PREFIX" \
  ./cmd/*

RUN install -D -m644 nfd-worker.conf.example /etc/kubernetes/node-feature-discovery/nfd-worker.conf

FROM debian:stretch-slim

ENV GRPC_GO_LOG_SEVERITY_LEVEL="INFO"

COPY --from=builder /etc/kubernetes/node-feature-discovery /etc/kubernetes/node-feature-discovery
COPY --from=builder /go/bin/nfd-* /usr/bin/
