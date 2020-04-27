FROM golang:1.14-alpine as build

ARG VERSION=v0.38.1
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/coreos/prometheus-operator

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    git clone --depth 1 -b ${VERSION} https://github.com/coreos/prometheus-operator . && \
    go build -mod=vendor -ldflags="-s -X ./pkg/version.Version=$(VERSION)" -o operator ./cmd/operator/main.go


FROM quay.io/prometheus/busybox:latest

COPY --from=build /go/src/github.com/coreos/prometheus-operator/operator /bin/operator

# On busybox 'nobody' has uid `65534'
USER 65534

ENTRYPOINT ["/bin/operator"]
