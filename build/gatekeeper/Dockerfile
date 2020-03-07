# Build the manager binary
FROM golang:1.14-alpine as builder

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN apk add --no-cache git

# Copy in the go src
WORKDIR /go/src/github.com/open-policy-agent/gatekeeper
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
    && git clone --depth 1 https://github.com/open-policy-agent/gatekeeper.git . \
    && go build -mod vendor -a -o manager main.go

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot
WORKDIR /
COPY --from=builder /go/src/github.com/open-policy-agent/gatekeeper/manager .
USER nonroot:nonroot

ENTRYPOINT ["/manager"]


