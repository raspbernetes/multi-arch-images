FROM --platform=$BUILDPLATFORM golang:1.13 AS builder
ARG VERSION=1.6.0
ARG BUILDPLATFORM
ARG TARGETPLATFORM
RUN mkdir /code && cd /code/ && git clone --depth 1 -b "v${VERSION}" https://github.com/kubernetes-csi/external-provisioner.git . \
     && GOARCH=$(echo $TARGETPLATFORM | cut -f2 -d '/') make build

FROM gcr.io/distroless/static:latest
LABEL description="CSI External provisioner"
COPY --from=builder /code/bin/csi-provisioner csi-provisioner
ENTRYPOINT ["/csi-provisioner"]
