ARG VERSION=1.6.5
ARG BASE_DISTRIBUTION=default

FROM istio/pilot:${VERSION} as pilot

FROM ${BASE_DISTRIBUTION}

ARG TARGETPLATFORM
ARG VERSION=1.6.5

COPY ./bin/pilot-discovery /usr/local/bin/pilot-discovery
COPY --from=pilot /cacert.pem /cacert.pem

USER 1337:1337

ENTRYPOINT ["/usr/local/bin/pilot-discovery"]
