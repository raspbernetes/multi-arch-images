ARG VERSION

FROM quay.io/kiali/kiali:${VERSION} as console

FROM golang:1.14 as builder

ARG VERSION

RUN set -eux; \
    \
    apt-get update; \
    apt-get install git;

RUN git clone --depth=1 -b ${VERSION} https://github.com/kiali/kiali.git /go/src/github.com/kiali/kiali;

WORKDIR /go/src/github.com/kiali/kiali

RUN make build

FROM registry.access.redhat.com/ubi8-minimal

LABEL maintainer="kiali-dev@googlegroups.com"

ENV KIALI_HOME=/opt/kiali \
    PATH=$KIALI_HOME:$PATH

WORKDIR $KIALI_HOME

RUN microdnf install -y shadow-utils && \
    microdnf clean all && \
    rm -rf /var/cache/yum && \
    adduser kiali

COPY --from=builder /go/bin/kiali $KIALI_HOME/

COPY --from=console $KIALI_HOME/console $KIALI_HOME/console

RUN chown -R kiali:kiali $KIALI_HOME/console && \
    chmod -R g=u $KIALI_HOME/console

USER kiali

ENTRYPOINT ["/opt/kiali/kiali"]
