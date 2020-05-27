FROM golang:1.14-alpine as build

ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git make

WORKDIR /go/src/github.com/cloudflare/cloudflared/

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    git clone https://github.com/cloudflare/cloudflared.git . && \
    make cloudflared

FROM gcr.io/distroless/static:nonroot

COPY --from=builder --chown=nonroot /go/src/github.com/cloudflare/cloudflared/cloudflared /usr/local/bin/

RUN cp /go/src/github.com/cloudflare/cloudflared/cloudflared /usr/local/bin/

USER nonroot:nonroot

ENTRYPOINT ["cloudflared", "--no-autoupdate"]

CMD ["version"]
