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

WORKDIR /go/src/github.com/cloudflare/cloudflared/

RUN git clone --depth 1 -b ${VERSION} https://github.com/cloudflare/cloudflared.git . && \
    make cloudflared

FROM gcr.io/distroless/static:nonroot

WORKDIR /

COPY --from=build --chown=nonroot /go/src/github.com/cloudflare/cloudflared/cloudflared /usr/local/bin/

USER nonroot:nonroot

ENTRYPOINT ["cloudflared", "--no-autoupdate"]

CMD ["version"]
