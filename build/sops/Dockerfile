ARG VERSION=v3.5.0

FROM golang:1.13-alpine as build

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

# hadolint ignore=DL3018
RUN apk add --no-cache git

# build sops
WORKDIR /go/src/github.com/mozilla/sops
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
    && git clone --depth 1 -b ${VERSION} https://github.com/mozilla/sops.git . \
    && go build -o sops ./cmd/sops

FROM scratch

COPY --from=build /go/src/github.com/mozilla/sops/sops /usr/local/bin/sops
