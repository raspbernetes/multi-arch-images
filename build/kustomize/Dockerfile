FROM --platform=${TARGETPLATFORM:-linux/amd64} golang:1.13-alpine as build

ARG VERSION=v3.5.4
ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/kubernetes-sigs/kustomize

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    git clone --depth 1 -b kustomize/${VERSION} https://github.com/kubernetes-sigs/kustomize.git . && \
    cd ./kustomize && \
    go build -o kustomize .

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

COPY --from=build /go/src/github.com/kubernetes-sigs/kustomize/kustomize/kustomize /usr/local/bin/kustomize

USER nonroot:nonroot

