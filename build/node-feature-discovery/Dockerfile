FROM golang:1.13.5-alpine as build

ARG VERSION=v0.6.0
ARG TARGETPLATFORM
ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add make git

WORKDIR /go/node-feature-discovery

RUN git clone --depth 1 -b ${VERSION} https://github.com/kubernetes-sigs/node-feature-discovery.git . \
    && export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) \
    && export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) \
    && GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1}

RUN go mod download

RUN go install \
  -ldflags "-s -w -X sigs.k8s.io/node-feature-discovery/pkg/version.version=$VERSION -X sigs.k8s.io/node-feature-discovery/source.pathPrefix=$HOSTMOUNT_PREFIX" \
  ./cmd/*
RUN install -D -m644 nfd-worker.conf.example /etc/kubernetes/node-feature-discovery/nfd-worker.conf

RUN make test

# Create production image for running node feature discovery
FROM debian:stretch-slim

# Use more verbose logging of gRPC
ENV GRPC_GO_LOG_SEVERITY_LEVEL="INFO"

COPY --from=build /etc/kubernetes/node-feature-discovery /etc/kubernetes/node-feature-discovery
COPY --from=build /go/bin/nfd-* /usr/bin/
