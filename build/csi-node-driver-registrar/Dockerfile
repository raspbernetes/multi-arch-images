FROM --platform=$BUILDPLATFORM golang:1.13 AS builder
ARG VERSION=1.3.0
ARG BUILDPLATFORM
ARG TARGETPLATFORM
RUN mkdir /code && cd /code/ && git clone --depth 1 -b "v${VERSION}" https://github.com/kubernetes-csi/node-driver-registrar.git . \
     && GOARCH=$(echo $TARGETPLATFORM | cut -f2 -d '/') make build

FROM gcr.io/distroless/static:latest
LABEL description="CSI Node Driver Registrar"
COPY --from=builder /code/bin/csi-node-driver-registrar csi-node-driver-registrar
ENTRYPOINT ["/csi-node-driver-registrar"]
