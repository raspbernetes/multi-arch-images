FROM golang:1.15-alpine as build

ARG VERSION=v2.2.0
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}

WORKDIR /go/src/github.com/thomseddon/traefik-forward-auth

RUN apk add --no-cache git

RUN git clone --depth 1 -b ${VERSION} https://github.com/thomseddon/traefik-forward-auth.git . && \
    go build -a -installsuffix nocgo -o /traefik-forward-auth ./cmd

# # Use distroless as minimal base image to package the manager binary
# # Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build --chown=nonroot /traefik-forward-auth /

USER nonroot:nonroot
