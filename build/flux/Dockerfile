ARG GOOS
ARG GOARCH
ARG VERSION

FROM golang:1.13-alpine as builder

RUN apk add --no-cache git && \
    git clone --depth 1 -b ${VERSION} https://github.com/fluxcd/flux.git . && \
    CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} GO111MODULE=on go build -o fluxd ./cmd/fluxd

FROM scratch

COPY --from=build /go/src/github.com/fluxcd/flux/fluxd /usr/local/bin/fluxd
