FROM --platform=$BUILDPLATFORM golang:1.13 AS builder

ARG VERSION=1.0.0
ARG BUILDPLATFORM
ARG TARGETPLATFORM

WORKDIR /go/src/github.com/kubernetes-csi/external-resizer/

COPY build.make.patch /build.make.patch

RUN apt-get update && apt-get install -y patch
RUN git clone --depth 1 -b "v${VERSION}" https://github.com/kubernetes-csi/external-resizer.git . \
     && patch -u release-tools/build.make -i /build.make.patch && GOARCH=$(echo $TARGETPLATFORM | cut -f2 -d '/') make build

FROM gcr.io/distroless/static:nonroot

WORKDIR /

LABEL description="CSI External resizer"

COPY --from=builder /go/src/github.com/kubernetes-csi/external-resizer/bin/csi-resizer csi-resizer

USER 0:0

ENTRYPOINT ["/csi-resizer"]
