FROM golang:1.15-alpine as builder

ARG TARGETPLATFORM
ARG VERSION=v1.2.0

ENV GO111MODULE=on

RUN apk add --no-cache git make bash alpine-sdk

WORKDIR /app

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
  export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
  export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
  git clone --depth 1 -b ${VERSION} https://github.com/mintel/dex-k8s-authenticator.git . && \
  make build

FROM alpine:3.12.0

# Dex connectors, such as GitHub and Google logins require root certificates.
# Proper installations should manage those certificates, but it's a bad user
# experience when this doesn't work out of the box.
#
# OpenSSL is required so wget can query HTTPS endpoints for health checking.
RUN apk add --update ca-certificates openssl curl tini

RUN mkdir -p /app/bin
COPY --from=builder /app/bin/dex-k8s-authenticator /app/bin/
COPY --from=builder /app/html /app/html
COPY --from=builder /app/templates /app/templates

# Add any required certs/key by mounting a volume on /certs
# The entrypoint will copy them and run update-ca-certificates at startup
RUN mkdir -p /certs

WORKDIR /app

COPY --from=builder /app/entrypoint.sh /
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]

CMD ["--help"]
