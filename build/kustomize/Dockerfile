ARG VERSION

FROM golang:1.13-alpine as build

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

# hadolint ignore=DL3018
RUN apk add --no-cache git

# build kustomize
WORKDIR /go/src/github.com/kubernetes-sigs/kustomize
RUN apkArch="$(apk --print-arch)"; \
    case "$apkArch" in \
    armv7) export GOARCH='arm' GOARM=7 ;; \
    aarch64) export GOARCH='arm64' ;; \
    x86_64) export GOARCH='amd64' ;; \
    esac; \
    echo "----------------------------------" \
    && echo "apk arch: $(apk --print-arch)" \
    && echo "parsed arch: ${GOARCH}" \
    && echo "----------------------------------" \
    && git clone --depth 1 -b kustomize/${VERSION} https://github.com/kubernetes-sigs/kustomize.git . \
    && cd ./kustomize \
    && go build -o kustomize .

FROM scratch

COPY --from=build /go/src/github.com/kubernetes-sigs/kustomize/kustomize/kustomize /usr/local/bin/kustomize
