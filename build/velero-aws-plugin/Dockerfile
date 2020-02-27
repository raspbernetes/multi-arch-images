FROM golang:1.13-alpine as build

ARG VERSION=v1.0.0

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux 

RUN apk add --no-cache git

WORKDIR /go/src/github.com/vmware-tanzu/velero-plugin-for-aws
RUN ARCH="$(apk --print-arch)"; \
    case "$ARCH" in \
    armv7) export GOARCH='arm' GOARM=7 ;; \
    aarch64) export GOARCH='arm64' ;; \
    x86_64) export GOARCH='amd64' ;; \
    esac; \
    echo "----------------------------------" && \
    echo "apk arch: $(apk --print-arch)" && \
    echo "parsed arch: ${GOARCH}" &&  \
    echo "----------------------------------" && \
    git clone --depth 1 -b ${VERSION} https://github.com/vmware-tanzu/velero-plugin-for-aws.git . && \
    go mod init && \
    go build -o velero-plugin-for-aws ./velero-plugin-for-aws

FROM alpine:3.10
WORKDIR /plugin
RUN apk add --no-cache bash ca-certificates
COPY --from=build /go/src/github.com/vmware-tanzu/velero-plugin-for-aws/velero-plugin-for-aws ./velero-plugin-for-aws
ENTRYPOINT ["/bin/bash", "-c", "cp /plugins/* /target/."]
