FROM golang:1.15.2

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=${TARGETOS} \
  GOARCH=${TARGETARCH} \
  GOARM=${TARGETVARIANT}

WORKDIR /go/src/sigs.k8s.io/descheduler

RUN apk add --no-cache git make

RUN git clone https://github.com/kubernetes-sigs/descheduler.git .

ARG VERSION
RUN VERSION=${VERSION} make

FROM scratch

COPY --from=0 /go/src/sigs.k8s.io/descheduler/_output/bin/descheduler /bin/descheduler

CMD ["/bin/descheduler", "--help"]
