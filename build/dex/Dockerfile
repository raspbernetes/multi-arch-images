FROM golang:1.15-alpine as builder

ARG TARGETPLATFORM
ARG VERSION=v2.24.0

ENV GO111MODULE=on

RUN apk add --no-cache git make bash alpine-sdk

WORKDIR /go/src/github.com/dexidp/dex

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
  export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
  export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
  git clone --depth 1 -b ${VERSION} https://github.com/dexidp/dex.git . && \
  cd /go/src/github.com/dexidp/dex && \
  make release-binary

FROM alpine:3.12
# Dex connectors, such as GitHub and Google logins require root certificates.
# Proper installations should manage those certificates, but it's a bad user
# experience when this doesn't work out of the box.
#
# OpenSSL is required so wget can query HTTPS endpoints for health checking.
RUN apk add --update ca-certificates openssl

USER 1001:1001

COPY --from=builder /go/bin/dex /usr/local/bin/dex

# Import frontend assets and set the correct CWD directory so the assets
# are in the default path.
COPY --from=builder /go/src/github.com/dexidp/dex/web /web

WORKDIR /

ENTRYPOINT ["dex"]

CMD ["version"]
