FROM golang:1.14-alpine as build

ARG VERSION=v0.1.1
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/vmware-tanzu/velero-plugin-for-csi

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    git clone --depth 1 -b ${VERSION} https://github.com/vmware-tanzu/velero-plugin-for-csi.git . && \
    go mod init && \
    go build -mod=mod -o /go/bin/velero-plugin-for-csi ./velero-plugin-for-csi

FROM alpine:3.12

WORKDIR /plugins

RUN apk add --no-cache bash ca-certificates

COPY --from=build /go/bin/velero-plugin-for-csi ./velero-plugin-for-csi

ENTRYPOINT ["/bin/bash", "-c", "cp /plugins/* /target/."]
