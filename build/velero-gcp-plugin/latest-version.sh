#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/vmware-tanzu/velero-plugin-for-gcp/releases/latest" | jq -r ".tag_name")

printf "%s" "${version}"
