#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/cloudflare/cloudflared/tags" | jq -r ".[0] .name")
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
          