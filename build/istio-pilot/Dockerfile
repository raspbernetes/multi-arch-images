ARG VERSION=1.6.5

FROM golang:1.15 as build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""
ARG VERSION=1.6.5

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}

WORKDIR /go/src/github.com/istio/istio

RUN git clone --depth 1 -b ${VERSION} https://github.com/istio/istio.git .

RUN go get github.com/jteeuwen/go-bindata/go-bindata@6025e8de665b && \
    ./operator/scripts/create_assets_gen.sh && \
    STATIC=0 LDFLAGS='-extldflags -static -s -w' ./common/scripts/gobuild.sh /go/src/github.com/istio/istio/out/pilot-discovery ./pilot/cmd/pilot-discovery

FROM istio/pilot:${VERSION} as pilot

FROM raspbernetes/istio-base:2020-07-10

ARG VERSION=1.6.5

COPY --from=build /go/src/github.com/istio/istio/out/pilot-discovery /usr/local/bin/pilot-discovery
COPY --from=pilot /cacert.pem /cacert.pem

USER 1337:1337

ENTRYPOINT ["/usr/local/bin/pilot-discovery"]
