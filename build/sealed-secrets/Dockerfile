FROM golang:1.13-alpine as build

ARG VERSION

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    VERSION=${VERSION}

RUN apk add --no-cache curl ca-certificates git

WORKDIR /go/src/github.com/bitnami-labs/sealed-secrets
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
    && git clone --depth 1 -b ${VERSION} https://github.com/bitnami-labs/sealed-secrets.git . \
    && go build -o controller ./cmd/controller

FROM alpine:3.10

RUN apk add --no-cache ca-certificates

COPY --from=build /go/src/github.com/bitnami-labs/sealed-secrets/controller /usr/local/bin/controller
RUN chmod +x /usr/local/bin/controller

ENTRYPOINT ["controller"]
