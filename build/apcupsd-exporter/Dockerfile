FROM golang:1.15-alpine as build

ARG VERSION=cbd49beaf01f4d70f33ce64ada787e73d8e9ea06
ARG TARGETPLATFORM

WORKDIR /go/src/github.com/mdlayher/apcupsd_exporter

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk update && \
    apk --no-cache add git alpine-sdk upx

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    git clone https://github.com/mdlayher/apcupsd_exporter.git . && \
    git fetch origin ${VERSION} && \
    go mod vendor && \
    go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o binary cmd/apcupsd_exporter/main.go && \
    upx -f --brute binary

# Use distroless as minimal base image to package the manager binary
FROM gcr.io/distroless/static:nonroot

WORKDIR /

LABEL name="apcupsd-exporter"

COPY --from=build /go/src/github.com/mdlayher/apcupsd_exporter/binary apcupsd-exporter

USER nonroot:nonroot

CMD ["/apcupsd-exporter"]
