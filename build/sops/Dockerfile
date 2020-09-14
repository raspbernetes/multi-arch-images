FROM golang:1.15-alpine as build

ARG VERSION=v3.5.0
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/mozilla/sops

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    git clone --depth 1 -b ${VERSION} https://github.com/mozilla/sops.git . && \
    go build -o sops ./cmd/sops

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

COPY --from=build /go/src/github.com/mozilla/sops/sops /usr/local/bin/sops

USER nonroot:nonroot
