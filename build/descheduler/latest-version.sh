#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/kubernetes-sigs/descheduler/tags" | jq -r ".[0] .name")
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
          