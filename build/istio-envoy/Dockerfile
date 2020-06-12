FROM morlay/istio-proxy-build-env:latest as builder

ARG VERSION=1.6.1

WORKDIR /go/src

# clone istio/proxy
RUN set -eux; \
    \
    git clone https://github.com/istio/proxy /go/src/proxy; \
    cd /go/src/proxy; \
    git checkout ${VERSION};

WORKDIR /go/src/proxy

# build envoy
RUN set -eux; \
    \
    export PATH="${LLVM_PATH}/bin:${PATH}"; \
    export JAVA_HOME="$(dirname $(dirname $(realpath $(which javac))))"; \
    export BAZEL_BUILD_ARGS="--verbose_failures --define=ABSOLUTE_JAVABASE=${JAVA_HOME} --javabase=@bazel_tools//tools/jdk:absolute_javabase --host_javabase=@bazel_tools//tools/jdk:absolute_javabase --java_toolchain=@bazel_tools//tools/jdk:toolchain_vanilla --host_java_toolchain=@bazel_tools//tools/jdk:toolchain_vanilla"; \
    make build_envoy; \
    mkdir -p /envoy; \
    cp -r bazel-bin/src/envoy /envoy

FROM gcr.io/distroless/static:nonroot

COPY --from=builder /envoy /envoy
