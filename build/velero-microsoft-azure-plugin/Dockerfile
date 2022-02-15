FROM golang:1.15-alpine as build

ARG VERSION=v1.0.0
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=${TARGETOS} \
  GOARCH=${TARGETARCH} \
  GOARM=${TARGETVARIANT}

RUN apk add --no-cache git

WORKDIR /go/src/github.com/vmware-tanzu/velero-plugin-for-microsoft-azure

RUN git clone --depth 1 -b ${VERSION} https://github.com/vmware-tanzu/velero-plugin-for-microsoft-azure.git . && \
    go build -o /go/bin/velero-plugin-for-microsoft-azure ./velero-plugin-for-microsoft-azure

FROM alpine:3.12

WORKDIR /plugins

RUN apk add --no-cache bash ca-certificates

COPY --from=build /go/bin/velero-plugin-for-microsoft-azure ./velero-plugin-for-microsoft-azure

ENTRYPOINT ["/bin/bash", "-c", "cp -r /plugins/* /target/."]
