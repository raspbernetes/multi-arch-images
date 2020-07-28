ARG VERSION=1.6.5
ARG BASE_DISTRIBUTION=default

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
    STATIC=0 LDFLAGS='-extldflags -static -s -w' ./common/scripts/gobuild.sh /go/src/github.com/istio/istio/out/pilot-agent ./pilot/cmd/pilot-agent

FROM istio/proxyv2:${VERSION} as proxyv2

FROM raspbernetes/istio-base:e0817929c81150b95947ed75690021a6c703c4d8

ARG VERSION=1.6.5

COPY --from=proxyv2 /var/lib/istio/envoy/envoy_bootstrap_tmpl.json /var/lib/istio/envoy/envoy_bootstrap_tmpl.json
COPY --from=proxyv2 /var/lib/istio/envoy/gcp_envoy_bootstrap_tmpl.json /var/lib/istio/envoy/gcp_envoy_bootstrap_tmpl.json

RUN chown -R istio-proxy /var/lib/istio

ADD https://github.com/querycap/istio-envoy-arm64/releases/download/${VERSION}/envoy /usr/local/bin/envoy

RUN chmod +x /usr/local/bin/envoy && \
    export ISTIO_META_VERSION=${VERSION} && \
    export ISTIO_META_ISTIO_PROXY_SHA="istio-proxy:$(/usr/local/bin/envoy --version | grep version | sed -e 's/.*version\: //g')"

COPY --from=build /go/src/github.com/istio/istio/out/pilot-agent /usr/local/bin/pilot-agent

COPY --from=proxyv2 /var/lib/istio/envoy/envoy_policy.yaml.tmpl /var/lib/istio/envoy/envoy_policy.yaml.tmpl
COPY --from=proxyv2 /etc/istio/extensions/stats-filter.wasm /etc/istio/extensions/stats-filter.wasm
COPY --from=proxyv2 /etc/istio/extensions/metadata-exchange-filter.wasm /etc/istio/extensions/metadata-exchange-filter.wasm

# The pilot-agent will bootstrap Envoy.
ENTRYPOINT ["/usr/local/bin/pilot-agent"]
