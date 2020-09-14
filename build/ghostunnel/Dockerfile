FROM golang:1.15-alpine as build

ARG VERSION=v1.5.2
ARG TARGETPLATFORM
ENV GO111MODULE=on \
    CGO_ENABLED=0
RUN apk add --no-cache \
    git \
    gcc \
    musl-dev \
    libtool \
    make
WORKDIR /go/src/github.com/square/ghostunnel
RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    git clone --depth 1 -b ${VERSION} https://github.com/square/ghostunnel.git . && \
    make clean ghostunnel

FROM alpine:3.12
WORKDIR /
RUN apk add --no-cache \
    bash \
    ca-certificates
COPY --from=build /go/src/github.com/square/ghostunnel/ghostunnel /usr/bin/ghostunnel
ENTRYPOINT ["/usr/bin/ghostunnel"]
