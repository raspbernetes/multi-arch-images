FROM golang:1.15-alpine as build

ARG VERSION=v1.9.5
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache make git

WORKDIR /opt

RUN git clone --depth 1 -b ${VERSION} https://github.com/kubernetes/kube-state-metrics.git . \
    && export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) \
    && export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) \
    && GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) \
    && go build -a -installsuffix cgo -ldflags '-s -w -extldflags "-static"' -o kube-state-metrics .

FROM alpine:3.12

COPY --from=build /opt/kube-state-metrics /

USER nobody

ENTRYPOINT ["/kube-state-metrics", "--port=8080", "--telemetry-port=8081"]

EXPOSE 8080 8081
