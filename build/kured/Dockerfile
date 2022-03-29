FROM golang:1.17.1 as build

ARG VERSION
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}

WORKDIR /go/src/github.com/weaveworks/kured

RUN git clone --depth 1 -b ${VERSION} https://github.com/weaveworks/kured.git . && \
    go build -ldflags "-X main.version=${VERSION}" -o kured ./cmd/kured/*.go

FROM alpine:3.15.3

RUN apk update --no-cache && apk upgrade --no-cache && apk add --no-cache ca-certificates tzdata

COPY --from=build /go/src/github.com/weaveworks/kured/kured /usr/bin/kured
RUN chmod +x /usr/bin/kured

ENTRYPOINT ["/usr/bin/kured"]
