FROM golang:1.15-alpine as builder

ARG VERSION
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=${TARGETOS} \
  GOARCH=${TARGETARCH} \
  GOARM=${TARGETVARIANT}

WORKDIR /go/src/github.com/thanos-io/thanos

RUN apk update && apk upgrade && apk add --no-cache alpine-sdk git make

RUN git clone --depth 1 -b "${VERSION}" https://github.com/thanos-io/thanos.git . && \
  make build

FROM quay.io/prometheus/busybox:latest
LABEL maintainer="The Thanos Authors"

COPY --from=builder /go/bin/thanos /bin/thanos

ENTRYPOINT [ "/bin/thanos" ]
