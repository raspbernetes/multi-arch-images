FROM golang:1.14-alpine as builder

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""
ARG VERSION=v2.24.0

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=${TARGETOS} \
  GOARCH=${TARGETARCH} \
  GOARM=${TARGETVARIANT}

RUN apk add --no-cache git make bash alpine-sdk

WORKDIR /go/src/github.com/dexidp/dex

RUN git clone --depth 1 -b ${VERSION} https://github.com/dexidp/dex.git . && \
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
