FROM golang:1.15-alpine as build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}

RUN apk add --no-cache git make

WORKDIR /go/src/github.com/cloudflare/cloudflared/

RUN git clone https://github.com/cloudflare/cloudflared.git . && \
    make cloudflared

FROM gcr.io/distroless/static:nonroot

WORKDIR /

COPY --from=build --chown=nonroot /go/src/github.com/cloudflare/cloudflared/cloudflared /usr/local/bin/

USER nonroot:nonroot

ENTRYPOINT ["cloudflared", "--no-autoupdate"]

CMD ["version"]
