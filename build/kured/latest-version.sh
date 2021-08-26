#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/weaveworks/kured/releases/latest" | jq -r ".tag_name")
printf "%s" "${version}"
