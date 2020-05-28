FROM --platform=$BUILDPLATFORM golang:1.13 AS builder
ARG VERSION=2.1.1
ARG BUILDPLATFORM
ARG TARGETPLATFORM
ADD ./build.make.patch /build.make.patch
RUN apt-get update && apt-get install -y patch \
     && mkdir /code && cd /code/ && git clone --depth 1 -b "v${VERSION}" https://github.com/kubernetes-csi/external-snapshotter.git . \
     && patch -u release-tools/build.make -i /build.make.patch && GOARCH=$(echo $TARGETPLATFORM | cut -f2 -d '/') make build

FROM gcr.io/distroless/static:latest
LABEL description="CSI External snapshotter"
COPY --from=builder /code/bin/csi-snapshotter csi-snapshotter
ENTRYPOINT ["/csi-snapshotter"]
