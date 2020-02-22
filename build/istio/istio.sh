#!/bin/bash
set -euo pipefail

COMPONENTS='pilot proxyv2 app app_sidecar test_policybackend mixer mixer_codegen citadel galley sidecar_injector kubectl istioctl operator'
TAG=9fdbf4f32acb6edd967340930dd54a7cb2730f8e
DOCKER_HUP_REPO=docker.io/xunholy

for COMPONENT in $COMPONENTS; do
    echo "$DOCKER_HUP_REPO/$COMPONENT:$TAG"
    docker tag "istio/$COMPONENT:$TAG" "$DOCKER_HUP_REPO/$COMPONENT:$TAG"
    docker push "$DOCKER_HUP_REPO/$COMPONENT:$TAG"
done
