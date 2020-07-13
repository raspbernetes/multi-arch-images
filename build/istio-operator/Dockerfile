ARG VERSION=1.6.5
ARG BASE_DISTRIBUTION=default

FROM golang:1.14-alpine as build

ARG TARGETPLATFORM

ENV GO111MODULE=on \
  CGO_ENABLED=0

WORKDIR /go/src/github.com/istio/istio

RUN apk add --no-cache git

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
  export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
  GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
  git clone --depth 1 -b ${VERSION} https://github.com/istio/istio.git . && \
  go get github.com/jteeuwen/go-bindata/go-bindata@6025e8de665b && \
  ./operator/scripts/create_assets_gen.sh && \
  LDFLAGS='-extldflags -static -s -w' common/scripts/gobuild.sh /tmp/bin/ ./operator/cmd/operator

FROM istio/operator:${VERSION} as operator

FROM ${BASE_DISTRIBUTION}

COPY --from=build /tmp/bin/operator /usr/local/bin/operator
COPY --from=operator /var/lib/istio/manifests/ /var/lib/istio/manifests/

ENTRYPOINT ["/usr/local/bin/operator"]
