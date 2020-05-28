#!/usr/bin/env bash

# Prepare Project
mkdir -p build
pushd build || exit
cmake -DBUILD_BPF=On ..

# Build Falco
KERNELDIR=/lib/modules/$(ls /lib/modules)/build make -j4 all
popd || exit

# Symbolic Link to /usr/bin/*
ln -s "$(pwd)/build/userspace/falco/falco" /usr/bin/falco
ln -s "$(pwd)/build/scripts/falco-driver-loader" /usr/bin/falco-driver-loader
