FROM golang:1.15-alpine as build

ARG VERSION=v0.1.1
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}

WORKDIR /go/src/github.com/vmware-tanzu/velero-plugin-for-csi

RUN apk add --no-cache git

RUN git clone --depth 1 -b ${VERSION} https://github.com/vmware-tanzu/velero-plugin-for-csi.git .
RUN go build -mod=mod -o /go/bin/velero-plugin-for-csi .

FROM alpine:3.12

WORKDIR /plugins

RUN apk add --no-cache bash ca-certificates

COPY --from=build /go/bin/velero-plugin-for-csi ./velero-plugin-for-csi

ENTRYPOINT ["/bin/bash", "-c", "cp /plugins/* /target/."]
