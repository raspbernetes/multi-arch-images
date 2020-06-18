FROM --platform=$BUILDPLATFORM golang:1.13 AS builder

ARG VERSION=2.2.0
ARG BUILDPLATFORM
ARG TARGETPLATFORM

WORKDIR /go/src/github.com/kubernetes-csi/external-attacher/

RUN git clone --depth 1 -b "v${VERSION}" https://github.com/kubernetes-csi/external-attacher.git . \
     && GOARCH=$(echo $TARGETPLATFORM | cut -f2 -d '/') make build

FROM gcr.io/distroless/static:nonroot

WORKDIR /

LABEL description="CSI External Attacher"

COPY --from=builder /go/src/github.com/kubernetes-csi/external-attacher/bin/csi-attacher csi-attacher

USER nonroot:nonroot

ENTRYPOINT ["/csi-attacher"]
