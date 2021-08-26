#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/infracloudio/botkube/tags" | jq -r ".[0] .name")
printf "%s" "${version}"
