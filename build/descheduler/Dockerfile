FROM golang:1.17.3

ARG VERSION
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=${TARGETOS} \
  GOARCH=${TARGETARCH} \
  GOARM=${TARGETVARIANT}

WORKDIR /go/src/sigs.k8s.io/descheduler

RUN git clone --depth 1 -b ${VERSION} https://github.com/kubernetes-sigs/descheduler.git . && \
  make

FROM scratch

USER 1000

COPY --from=0 /go/src/sigs.k8s.io/descheduler/_output/bin/descheduler /bin/descheduler

CMD ["/bin/descheduler", "--help"]
