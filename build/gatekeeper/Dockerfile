FROM --platform=${TARGETPLATFORM:-linux/amd64} golang:1.13-alpine as build

ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

ENV GO111MODULE=on \
    CGO_ENABLED=0

RUN apk add --no-cache git

WORKDIR /go/src/github.com/open-policy-agent/gatekeeper

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    git clone --depth 1 https://github.com/open-policy-agent/gatekeeper.git . && \
    go build -mod vendor -a -o manager main.go

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot

WORKDIR /

COPY --from=builder /go/src/github.com/open-policy-agent/gatekeeper/manager .

USER nonroot:nonroot

ENTRYPOINT ["/manager"]
