FROM golang:1.15-alpine as build

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=${TARGETOS} \
  GOARCH=${TARGETARCH} \
  GOARM=${TARGETVARIANT}

RUN apk add --no-cache git ca-certificates curl

WORKDIR /go/src/github.com/infracloudio/botkube/

RUN git clone https://github.com/infracloudio/botkube.git . && \
  go build -o /go/bin/botkube ./cmd/botkube

RUN wget -q https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/${GOARCH}/kubectl -O /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

FROM gcr.io/distroless/static:nonroot

WORKDIR /

USER nonroot:nonroot

COPY --from=build /go/bin/botkube /go/bin/botkube
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /usr/local/bin/kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/go/bin/botkube"]

