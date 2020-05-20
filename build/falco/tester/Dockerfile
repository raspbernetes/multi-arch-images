FROM golang:1.14-alpine as build

ARG TARGETPLATFORM

ENV GO111MODULE=on \
    CGO_ENABLED=0  \
    FALCO_VERSION=0.23.0  \
    BUILD_TYPE=release


RUN apk add --no-cache git make

WORKDIR /go/src/github.com/falcosecurity/falco

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    git clone --depth 1 -b ${VERSION} https://github.com/falcosecurity/falco.git . && \
    go mod vendor && \
    go build -ldflags '-s -w' -o binary ./ && \
    upx -f --brute binary

FROM fedora:31

LABEL name="falcosecurity/falco-tester"
LABEL usage="docker run -v /boot:/boot:ro -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/..:/source -v $PWD/build:/build -e FALCO_VERSION=<current_falco_version> --name <name> falcosecurity/falco-tester test"
LABEL maintainer="cncf-falco-dev@lists.cncf.io"

RUN dnf install -y python-pip python docker findutils jq unzip && dnf clean all
ENV PATH="/root/.local/bin/:${PATH}"
RUN pip install --user avocado-framework==69.0
RUN pip install --user avocado-framework-plugin-varianter-yaml-to-mux==69.0

COPY --from=build  /go/src/github.com/falcosecurity/falco/binary/root /

ENTRYPOINT ["entrypoint"]
CMD ["usage"]