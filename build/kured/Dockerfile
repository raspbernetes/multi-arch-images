FROM golang:1.15-alpine as build

ARG VERSION=1.7.0
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN apk add --no-cache git curl

WORKDIR /go/src/github.com/weaveworks/kured

# hadolint ignore SC1072
RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    git clone --depth 1 -b ${VERSION} https://github.com/weaveworks/kured.git . && \
    go build -ldflags "-X main.version=${VERSION}" -o kured ./cmd/kured/*.go

FROM alpine:3.13

RUN apk add --no-cache ca-certificates tzdata

COPY --from=build /go/src/github.com/weaveworks/kured/kured /usr/bin/kured
RUN chmod +x /usr/bin/kured

ENTRYPOINT ["/usr/bin/kured"]
