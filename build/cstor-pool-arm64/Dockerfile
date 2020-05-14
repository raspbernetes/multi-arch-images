FROM arm64v8/ubuntu AS build

RUN apt-get update && apt-get install -y build-essential wget devscripts debhelper dh-exec dh-autoreconf

WORKDIR /root

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/j/json-c/json-c_0.11-4ubuntu2.dsc && \
  wget http://archive.ubuntu.com/ubuntu/pool/main/j/json-c/json-c_0.11.orig.tar.gz && \
  wget http://archive.ubuntu.com/ubuntu/pool/main/j/json-c/json-c_0.11-4ubuntu2.debian.tar.xz && \
  dpkg-source -x json-c_0.11-4ubuntu2.dsc && \
  cd json-c-0.11 && \
  DEB_CFLAGS_SET="-Wno-error=implicit-fallthrough" debuild -us -uc

FROM quay.io/openebs/cstor-pool-arm64:1.9.0 AS run

COPY --from=build /root/libjson-c2_0.11-4ubuntu2_arm64.deb /tmp/libjson-c2.deb
RUN dpkg -i /tmp/libjson-c2.deb && rm /tmp/libjson-c2.deb