#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/thomseddon/traefik-forward-auth/releases/latest" | jq -r ".tag_name")
printf "%s" "${version}"
