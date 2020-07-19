FROM golang:1.14 as builder

ARG TARGETPLATFORM
ARG VERSION=v0.7.2

WORKDIR /sigs.k8s.io/external-dns

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
  export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
  GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
  git clone --depth 1 -b ${VERSION} https://github.com/kubernetes-sigs/external-dns.git . && \
  go mod vendor && \
  make build

FROM alpine:3.12

RUN apk add --update --no-cache ca-certificates && \
  update-ca-certificates

COPY --from=builder /sigs.k8s.io/external-dns/build/external-dns /bin/external-dns

# Run as UID for nobody since k8s pod securityContext runAsNonRoot can't resolve the user ID:
# https://github.com/kubernetes/kubernetes/issues/40958
USER 65534

ENTRYPOINT ["/bin/external-dns"]
