SHELL := /bin/bash -o pipefail

CONTAINER_CLI ?= docker

LOCAL_ARCH ?= $(shell uname -m)
ifeq ($(LOCAL_ARCH),x86_64)
    TARGET_ARCH ?= amd64
	BUILDX ?= amd64
else ifeq ($(shell echo $(LOCAL_ARCH) | head -c 5),armv8)
    TARGET_ARCH ?= arm64
	BUILDX ?= arm64
else ifeq ($(LOCAL_ARCH),aarch64)
    TARGET_ARCH ?= arm64
	BUILDX ?= arm64
else ifeq ($(shell echo $(LOCAL_ARCH) | head -c 5),armv7)
    TARGET_ARCH ?= arm
	BUILDX ?= arm/v7
else ifeq ($(shell echo $(LOCAL_ARCH) | head -c 5),armv6)
	TARGET_ARCH ?= arm
	BUILDX ?= arm/v6
else
    $(error This system's architecture $(LOCAL_ARCH) isn't supported)
endif


LOCAL_OS ?= $(shell uname)
ifeq ($(LOCAL_OS),Linux)
    TARGET_OS ?= linux
    READLINK_FLAGS="-f"
else ifeq ($(LOCAL_OS),Darwin)
    TARGET_OS ?= darwin
    READLINK_FLAGS=""
else
    $(error This system's OS $(LOCAL_OS) isn't supported)
endif

TAG ?= $(shell git rev-parse --verify HEAD)
ifeq ($(TAG),)
  $(error "TAG cannot be empty")
endif

FLUX_VERSION ?= 1.18.0
KUSTOMIZE_VERSION ?= v3.5.4
SOPS_VERSION ?= v3.5.0
KUBECTL_VERSION ?= v1.15.9

.PHONY: flux
flux:
	$(CONTAINER_CLI) buildx build \
		--platform $(TARGET_OS)/$(BUILDX) \
		--build-arg=GOOS=$(TARGET_OS) \
		--build-arg=GOARCH=$(TARGET_ARCH) \
		--build-arg=FLUX_VERSION=$(FLUX_VERSION) \
		--build-arg=KUBECTL_VERSION=$(KUBECTL_VERSION) \
		--file build/flux/Dockerfile \
		--tag xunholy/flux:$(TAG) \
		./build/flux/ --push
