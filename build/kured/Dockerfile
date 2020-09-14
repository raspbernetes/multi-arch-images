FROM golang:1.15-alpine as build

ARG VERSION=1.3.0
ARG KUBECTL_VERSION=v1.15.10
ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git curl

WORKDIR /go/src/github.com/weaveworks/kured

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) && \
    curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/${GOARCH}/kubectl" && \
    git clone --depth 1 -b ${VERSION} https://github.com/weaveworks/kured.git . && \
    go build -o kured ./cmd/kured

FROM alpine:3.12.0

COPY --from=build /usr/bin/kubectl /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl

COPY --from=build /go/src/github.com/weaveworks/kured/kured /usr/bin/kured
RUN chmod +x /usr/bin/kured

ENTRYPOINT ["/usr/bin/kured"]
