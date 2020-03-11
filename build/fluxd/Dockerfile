FROM golang:1.14-alpine as build

ARG VERSION=1.18.0
ARG BUILDPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/fluxcd/flux

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    git clone --depth 1 -b ${VERSION} https://github.com/fluxcd/flux.git . && \
    go build -o fluxd ./cmd/fluxd

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

COPY --from=build /go/src/github.com/fluxcd/flux/fluxd /usr/local/bin/fluxd

USER nonroot:nonroot
