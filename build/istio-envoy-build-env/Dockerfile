FROM ubuntu:18.04
ARG TARGETARCH

ENV DEBIAN_FRONTEND noninteractive

RUN set -eux; \
    \
    echo "deb-src http://ports.ubuntu.com/ubuntu-ports/ bionic-security main restricted" >> /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -y \
    build-essential \
    apt-utils \
    unzip \
    git \
    make \
    cmake \
    automake \
    autoconf \
    libtool \
    virtualenv \
    python \
    vim \
    g++ \
    wget \
    ninja-build \
    curl \
    lsb-core \
    openjdk-11-jdk \
    software-properties-common;

## added gn
RUN set -eux; \
    \
     case "${TARGETARCH}" in \
        amd64) \
            wget -O gntool.zip https://chrome-infra-packages.appspot.com/dl/gn/gn/linux-amd64/+/latest; \
            unzip gntool.zip -d gntool; \
            cp gntool/gn /usr/local/bin/gn; \
            chmod +x /usr/local/bin/gn; \
            rm -rf gntool*; \
        ;; \
        arm64) \
            wget -O /usr/local/bin/gn https://github.com/Jingzhao123/google-gn/releases/download/gn-arm64/gn; \
            chmod +x /usr/local/bin/gn; \
        ;; \
        *) echo "unsupported architecture"; exit 1 ;; \
     esac;

# build hsdis-<arch>.so
# see https://metebalci.com/blog/how-to-build-the-hsdis-disassembler-plugin-on-ubuntu-18/
RUN set -eux; \
    \
    case "${TARGETARCH}" in \
        amd64) export ARCH=amd64;; \
        arm64) export ARCH=aarch64;; \
        *) echo "unsupported architecture"; exit 1 ;; \
    esac; \
    mkdir -p /usr/lib/jvm/java-11-openjdk-${TARGETARCH}/lib; \
    \
    mkdir -p /tmp/jdk && cd /tmp/jdk;  \
    apt source openjdk-11-jdk-headless; \
    cd $(ls -b | head -1)/src/utils/hsdis; \
    \
    wget https://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.gz; \
    tar -xzf binutils-2.32.tar.gz; \
    export BINUTILS=binutils-2.32; \
    sed -i -e 's/app_data->dfn = disassembler(native_bfd)/app_data->dfn = disassembler(bfd_get_arch(native_bfd),bfd_big_endian(native_bfd),bfd_get_mach(native_bfd),native_bfd)/g' hsdis.c;\
    make all64; \
    \
    cp build/linux-${ARCH}/hsdis-${ARCH}.so /usr/lib/jvm/java-11-openjdk-${TARGETARCH}/lib/; \
    cp build/linux-${ARCH}/hsdis-${ARCH}.so /usr/lib/jvm/java-11-openjdk-${TARGETARCH}/lib/server/; \
    rm -rf /tmp/jdk;

# bazelisk
RUN set -eux; \
    \
    case "${TARGETARCH}" in \
        amd64) BAZELISK_URL=https://github.com/bazelbuild/bazelisk/releases/download/v1.5.0/bazelisk-linux-amd64;; \
        arm64) BAZELISK_URL=https://github.com/Tick-Tocker/bazelisk-arm64/releases/download/arm64/bazelisk-linux-arm64;; \
        *) echo "unsupported architecture"; exit 1 ;; \
    esac; \
    wget -O /usr/local/bin/bazel ${BAZELISK_URL}; \
    chmod +x /usr/local/bin/bazel


# golang
ENV GOVERSION=1.14.4

RUN set -eux; \
    \
    curl -LO https://dl.google.com/go/go${GOVERSION}.linux-${TARGETARCH}.tar.gz; \
    tar -C /usr/local -xzf go${GOVERSION}.linux-${TARGETARCH}.tar.gz; \
    rm go${GOVERSION}.linux-${TARGETARCH}.tar.gz; \
    export PATH=$PATH:/usr/local/go/bin; \
    export PATH=$PATH:/root/go/bin; \
    export GOPATH=$HOME/go; \
    go get -u github.com/bazelbuild/buildtools/buildifier; \
    export BUILDIFIER_BIN=$GOPATH/bin/buildifier; \
    go get -u github.com/bazelbuild/buildtools/buildozer; \
    export BUILDOZER_BIN=$GOPATH/bin/buildozer;

ENV LLVM_VERSION=9.0.0
ENV LLVM_PATH=/usr/lib/llvm-9

RUN set -eux; \
    \
    case "${TARGETARCH}" in \
        amd64) export LLVM_RELEASE=clang+llvm-${LLVM_VERSION}-x86_64-linux-gnu-ubuntu-18.04;; \
        arm64) export LLVM_RELEASE=clang+llvm-${LLVM_VERSION}-aarch64-linux-gnu;; \
        *) echo "unsupported architecture"; exit 1 ;; \
    esac; \
    curl -LO  "https://releases.llvm.org/${LLVM_VERSION}/${LLVM_RELEASE}.tar.xz"; \
    tar Jxf "${LLVM_RELEASE}.tar.xz"; \
    mv "./${LLVM_RELEASE}" ${LLVM_PATH}; \
    chown -R root:root ${LLVM_PATH}; \
    rm "./${LLVM_RELEASE}.tar.xz"; \
    echo "${LLVM_PATH}/lib" > /etc/ld.so.conf.d/llvm.conf; \
    ldconfig; \
    export PATH="${LLVM_PATH}/bin:${PATH}";
