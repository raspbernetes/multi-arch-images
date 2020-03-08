FROM --platform=${TARGETPLATFORM:-linux/amd64} golang:1.13-alpine as build

ARG VERSION=v1.0.0
ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/vmware-tanzu/velero-plugin-for-aws

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    git clone --depth 1 -b ${VERSION} https://github.com/vmware-tanzu/velero-plugin-for-aws.git . && \
    go mod init && \
    go build -o velero-plugin-for-aws ./velero-plugin-for-aws

FROM alpine:3.11

WORKDIR /plugin

RUN apk add --no-cache bash ca-certificates

COPY --from=build /go/src/github.com/vmware-tanzu/velero-plugin-for-aws/velero-plugin-for-aws ./velero-plugin-for-aws

ENTRYPOINT ["/bin/bash", "-c", "cp /plugins/* /target/."]
