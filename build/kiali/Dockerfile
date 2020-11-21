ARG VERSION=v1.21.0

FROM quay.io/kiali/kiali:${VERSION} as console

FROM golang:1.15 as builder

ARG VERSION

RUN set -eux;

WORKDIR /go/src/github.com/kiali/kiali

RUN git clone --depth=1 -b ${VERSION} https://github.com/kiali/kiali.git .

RUN make build

FROM registry.access.redhat.com/ubi8-minimal

WORKDIR /opt/kiali

RUN microdnf install -y shadow-utils && \
    microdnf clean all && \
    rm -rf /var/cache/yum && \
    adduser kiali

COPY --from=builder /go/bin/kiali ./

COPY --from=console /opt/kiali/console ./console

RUN chown -R kiali:kiali ./console && \
    chmod -R g=u ./console

USER kiali

ENTRYPOINT ["/opt/kiali/kiali"]
