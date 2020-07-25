FROM ubuntu:20.10 AS build

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential wget devscripts debhelper dh-exec dh-autoreconf

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/j/json-c/json-c_0.11-4ubuntu2.dsc && \
  wget http://archive.ubuntu.com/ubuntu/pool/main/j/json-c/json-c_0.11.orig.tar.gz && \
  wget http://archive.ubuntu.com/ubuntu/pool/main/j/json-c/json-c_0.11-4ubuntu2.debian.tar.xz && \
  dpkg-source -x json-c_0.11-4ubuntu2.dsc

WORKDIR /root/json-c-0.11

RUN DEB_CFLAGS_SET="-Wno-error=implicit-fallthrough" debuild --no-lintian -us -uc

FROM quay.io/openebs/cstor-pool-arm64:1.12.0 AS run

COPY --from=build /root/libjson-c2_0.11-4ubuntu2_arm64.deb /tmp/libjson-c2.deb

RUN dpkg -i /tmp/libjson-c2.deb && rm /tmp/libjson-c2.deb
