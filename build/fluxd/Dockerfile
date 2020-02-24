FROM golang:1.13-alpine as build

ARG VERSION=1.18.0

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

# hadolint ignore=DL3018
RUN apk add --no-cache git

# build flux
WORKDIR /go/src/github.com/fluxcd/flux
RUN ARCH="$(apk --print-arch)"; \
    case "$ARCH" in \
    armv7) export GOARCH='arm' GOARM=7 ;; \
    aarch64) export GOARCH='arm64' ;; \
    x86_64) export GOARCH='amd64' ;; \
    esac; \
    echo "----------------------------------" \
    && echo "apk arch: $(apk --print-arch)" \
    && echo "parsed arch: ${GOARCH}" \
    && echo "----------------------------------" \
    && git clone --depth 1 -b ${VERSION} https://github.com/fluxcd/flux.git . \
    && go build -o fluxd ./cmd/fluxd

FROM scratch

COPY --from=build /go/src/github.com/fluxcd/flux/fluxd /usr/local/bin/fluxd

