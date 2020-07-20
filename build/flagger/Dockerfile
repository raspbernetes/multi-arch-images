FROM golang:1.14 as build

ARG TARGETPLATFORM
ARG VERSION=v1.0.1

WORKDIR /go/src/github.com/weaveworks/flagger

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
  export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
  GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
  git clone --depth 1 -b ${VERSION} https://github.com/weaveworks/flagger.git . && \
  make build

FROM alpine:3.12

RUN apk --no-cache add ca-certificates

USER nobody

COPY --from=build --chown=nobody:nobody /go/src/github.com/weaveworks/flagger/bin/flagger .

ENTRYPOINT ["./flagger"]
