#!/bin/bash
set -euo pipefail

COMPONENTS='operator istioctl galley citadel mixer_codegen mixer test_policybackend app_sidecar app proxyv2 pilot'
TAG=9a02d46ea3d5b7cfcad6108e2b84c30f5d10ad88
DOCKER_HUP_REPO=docker.io/xunholy

for COMPONENT in $COMPONENTS; do
    echo "$DOCKER_HUP_REPO/$COMPONENT:$TAG"
    docker tag "istio/$COMPONENT:$TAG" "$DOCKER_HUP_REPO/$COMPONENT:$TAG"
    docker push "$DOCKER_HUP_REPO/$COMPONENT:$TAG"
done
