FROM golang:1.14-alpine as build

ARG VERSION=0.0.8
ARG TARGETPLATFORM

WORKDIR /go/src/github.com/eko/pihole-exporter

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk update && \
    apk --no-cache add git alpine-sdk upx

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    git clone --depth 1 -b ${VERSION} https://github.com/eko/pihole-exporter.git . && \
    go mod vendor && \
    go build -ldflags '-s -w' -o binary ./ && \
    upx -f --brute binary

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

LABEL name="pihole-exporter"

WORKDIR /root/

COPY --from=build /go/src/github.com/eko/pihole-exporter/binary pihole-exporter

USER nonroot:nonroot

CMD ["./pihole-exporter"]
