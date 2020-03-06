FROM --platform=$BUILDPLATFORM golang:1.13-alpine as build

ARG VERSION
ARG TARGETPLATFORM
ARG BUILDPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    VERSION=${VERSION}

RUN apk add --no-cache curl git

WORKDIR /go/src/github.com/bitnami-labs/sealed-secrets

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3) && \
    git clone --depth 1 -b ${VERSION} https://github.com/bitnami-labs/sealed-secrets.git . && \
    go build -o controller ./cmd/controller

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

COPY --from=build /go/src/github.com/bitnami-labs/sealed-secrets/controller /usr/local/bin/controller

USER nonroot:nonroot

ENTRYPOINT ["controller"]
