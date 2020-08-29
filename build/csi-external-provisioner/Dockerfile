FROM --platform=$BUILDPLATFORM golang:1.13 AS builder

ARG VERSION=1.6.0
ARG BUILDPLATFORM
ARG TARGETPLATFORM

WORKDIR /go/src/github.com/kubernetes-csi/external-provisioner/

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
     export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
     export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
     git clone --depth 1 -b "v${VERSION}" https://github.com/kubernetes-csi/external-provisioner.git . && \
     BUILD_PLATFORMS="$GOOS;$GOARCH" make build

FROM gcr.io/distroless/static:nonroot

WORKDIR /

LABEL description="CSI External provisioner"

COPY --from=builder /go/src/github.com/kubernetes-csi/external-provisioner/bin/csi-provisioner csi-provisioner

USER 0:0

ENTRYPOINT ["/csi-provisioner"]
