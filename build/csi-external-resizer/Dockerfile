FROM --platform=$BUILDPLATFORM golang:1.13 AS builder

ARG VERSION=0.5.0
ARG BUILDPLATFORM
ARG TARGETPLATFORM

WORKDIR /go/src/github.com/kubernetes-csi/external-resizer/

RUN git clone --depth 1 -b "v${VERSION}" https://github.com/kubernetes-csi/external-resizer.git . \
     && GOARCH=$(echo $TARGETPLATFORM | cut -f2 -d '/') make build

FROM gcr.io/distroless/static:nonroot

WORKDIR /

LABEL description="CSI External resizer"

COPY --from=builder /go/src/github.com/kubernetes-csi/external-resizer/bin/csi-resizer csi-resizer

ENTRYPOINT ["/csi-resizer"]
