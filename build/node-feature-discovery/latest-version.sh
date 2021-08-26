#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/kubernetes-sigs/node-feature-discovery/releases/latest" | jq -r ".tag_name")

printf "%s" "${version}"
