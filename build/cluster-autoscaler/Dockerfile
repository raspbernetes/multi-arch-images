FROM golang:1.15-alpine as build

ARG TARGETPLATFORM

ENV GO111MODULE=off \
  CGO_ENABLED=0

RUN apk add --no-cache git make

WORKDIR /go/src/k8s.io/autoscaler/

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
  export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
  GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
  git clone https://github.com/kubernetes/autoscaler.git . && \
  cd cluster-autoscaler && \
  make build-binary

FROM gcr.io/distroless/static:nonroot

WORKDIR /

COPY --from=build --chown=nonroot /go/src/k8s.io/autoscaler/cluster-autoscaler/cluster-autoscaler .

USER nonroot:nonroot

CMD ["/cluster-autoscaler"]
