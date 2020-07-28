ARG VERSION=1.6.5

FROM golang:1.14 as build

ARG VERSION=1.6.5
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

WORKDIR /go/src/github.com/istio/istio

RUN git clone --depth 1 -b ${VERSION} https://github.com/istio/istio.git .

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    GO111MODULE=on go get github.com/jteeuwen/go-bindata/go-bindata@6025e8de665b && \
    ./operator/scripts/create_assets_gen.sh && \
    STATIC=0 LDFLAGS='-extldflags -static -s -w' ./common/scripts/gobuild.sh /go/src/github.com/istio/istio/out/pilot-discovery ./pilot/cmd/pilot-discovery

FROM istio/pilot:${VERSION} as pilot

FROM raspbernetes/istio-base:e0817929c81150b95947ed75690021a6c703c4d8

ARG TARGETPLATFORM
ARG VERSION=1.6.5

COPY --from=build /go/src/github.com/istio/istio/out/pilot-discovery /usr/local/bin/pilot-discovery
COPY --from=pilot /cacert.pem /cacert.pem

USER 1337:1337

ENTRYPOINT ["/usr/local/bin/pilot-discovery"]
