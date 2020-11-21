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
  STATIC=0 LDFLAGS='-extldflags -static -s -w' ./common/scripts/gobuild.sh /go/src/github.com/istio/istio/out/operator ./operator/cmd/operator

FROM istio/operator:${VERSION} as operator

FROM raspbernetes/istio-base:2020-07-10

COPY --from=build /go/src/github.com/istio/istio/out/operator /usr/local/bin/operator
COPY --from=operator /var/lib/istio/manifests/ /var/lib/istio/manifests/

ENTRYPOINT ["/usr/local/bin/operator"]

