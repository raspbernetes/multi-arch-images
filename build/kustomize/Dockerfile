FROM golang:1.15-alpine as build

ARG VERSION=kustomize/v3.8.2
ARG TARGETPLATFORM

ENV GO111MODULE=on \
  CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/kubernetes-sigs/kustomize

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
  export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
  export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
  git clone --depth 1 -b ${VERSION} https://github.com/kubernetes-sigs/kustomize.git . && \
  cd ./kustomize && \
  go build \
  -ldflags="\
  -X 'sigs.k8s.io/kustomize/api/provenance.version=${VERSION}' \
  -X 'sigs.k8s.io/kustomize/api/provenance.gitCommit=$(git rev-parse --verify HEAD)' \
  -X 'sigs.k8s.io/kustomize/api/provenance.buildDate=$(date -u -Iseconds)' \
  " \
  -o kustomize .

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

COPY --from=build /go/src/github.com/kubernetes-sigs/kustomize/kustomize/kustomize /usr/local/bin/kustomize

USER nonroot:nonroot

