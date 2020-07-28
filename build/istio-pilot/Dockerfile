ARG VERSION=1.6.5
ARG BASE_DISTRIBUTION=default

FROM istio/pilot:${VERSION} as pilot

FROM raspbernetes/istio-base:e0817929c81150b95947ed75690021a6c703c4d8

ARG TARGETPLATFORM
ARG VERSION=1.6.5

COPY ./bin/pilot-discovery /usr/local/bin/pilot-discovery
COPY --from=pilot /cacert.pem /cacert.pem

USER 1337:1337

ENTRYPOINT ["/usr/local/bin/pilot-discovery"]
