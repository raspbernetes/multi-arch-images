FROM --platform=$BUILDPLATFORM ubuntu:focal as build

ARG BUILDPLATFORM
ARG TARGETPLATFORM
ARG FALCO_VERSION=0.23.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y \
    libssl-dev \
    libyaml-dev \
    libncurses-dev \
    libc-ares-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libjq-dev \
    libyaml-cpp-dev \
    libgrpc++-dev \
    protobuf-compiler-grpc \
    rpm \
    libelf-dev \
    cmake \
    build-essential \
    libcurl4-openssl-dev \
    linux-headers-generic \
    clang \
    llvm \
    git \
    curl \
    kmod

WORKDIR /go/src/github.com/falcosecurity/falco

# Checkout Project
RUN git clone --depth 1 -b ${FALCO_VERSION} https://github.com/falcosecurity/falco.git .

COPY script.sh .

RUN ./script.sh

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/go/src/github.com/falcosecurity/falco/build/userspace/falco/falco"]
