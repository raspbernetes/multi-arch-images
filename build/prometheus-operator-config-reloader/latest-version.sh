#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/coreos/prometheus-operator/releases/latest" | jq -r ".tag_name")
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
