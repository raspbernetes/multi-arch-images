#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/mintel/dex-k8s-authenticator/releases/latest" | jq -r ".tag_name")
printf "%s" "${version}"
