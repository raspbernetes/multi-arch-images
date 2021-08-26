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

WORKDIR /go/src/k8s.io/autoscaler/

RUN git clone https://github.com/kubernetes/autoscaler.git . && \
  cd cluster-autoscaler && \
  make build-binary

FROM gcr.io/distroless/static:nonroot

WORKDIR /

COPY --from=build --chown=nonroot /go/src/k8s.io/autoscaler/cluster-autoscaler/cluster-autoscaler .

USER nonroot:nonroot

CMD ["/cluster-autoscaler"]
