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
else ifeq ($(shell echo $(LOCAL_ARCH) | head -c 4),armv7)
    TARGET_ARCH ?= arm
	BUILDX ?= arm/v7
else ifeq ($(shell echo $(LOCAL_ARCH) | head -c 4),armv6)
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

.PHONY: flux
flux: 
	$(CONTAINER_CLI) buildx build --platform $(TARGET_OS)/$(BUILDX) --build-arg=GOOS=$(TARGET_OS) --build-arg=GOARCH=$(TARGET_ARCH) --file build/flux/Dockerfile .




	# docker buildx build \                                                                                                                          (kubernetes-admin@kubernetes/flux)
    # --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/ppc64le,linux/s390x \
    # --output "type=image,push=false" \
    # -f ./docker/Dockerfile .