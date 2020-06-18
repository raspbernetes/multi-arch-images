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
    go build -mod=vendor -ldflags="-s -X ./pkg/version.Version=$(VERSION)" -o prometheus-config-reloader ./cmd/prometheus-config-reloader/main.go


FROM gcr.io/distroless/static:nonroot

WORKDIR /

COPY --from=build /go/src/github.com/coreos/prometheus-operator/prometheus-config-reloader prometheus-config-reloader

USER nonroot:nonroot

ENTRYPOINT ["/prometheus-config-reloader"]
