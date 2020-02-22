#!/bin/bash
set -euo pipefail

export RPI_HOME=/home/pi
COMPILER_VERSION=1.4.3
VERSION=1.13.4
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

# Setup Go1.4.3 Tarball for compiling later Go versions for ARM
rm -rf /usr/local/go
curl -O "https://storage.googleapis.com/golang/go${COMPILER_VERSION}.src.tar.gz"
tar -xzf "$RPI_HOME/go${COMPILER_VERSION}.src.tar.gz" -C /usr/local
cd /usr/local/go/src
time sudo ./make.bash
tar --numeric-owner -czf "$RPI_HOME/go${COMPILER_VERSION}.${OS}-${ARCH}.tar.gz" -C /usr/local go

# Move Go1.4.3 to $RPI_HOME dir
rm -rf "$RPI_HOME/go1.4"
mkdir -p "$RPI_HOME/go1.4"
tar -xzf "$RPI_HOME/go${COMPILER_VERSION}.${OS}-${ARCH}.tar.gz" -C "$RPI_HOME/go1.4" --strip-components=1

# Setup Go1.13.4 Tarball using Go1.4.3 compiler
sudo rm -rf /usr/local/go
curl -sSL "https://storage.googleapis.com/golang/go${VERSION}.src.tar.gz" | sudo tar -xz -C /usr/local
cd /usr/local/go/src
time sudo GOROOT_BOOTSTRAP=/home/pi/go1.4 ./make.bash
tar --numeric-owner -czf "$RPI_HOME/go${VERSION}.${OS}-${ARCH}.tar.gz" -C /usr/local go

rm -rf /usr/local/go
tar -xzf "$RPI_HOME/go${VERSION}.${OS}-${ARCH}.tar.gz" -C /usr/local
export PATH=/usr/local/go/bin:$PATH
go version