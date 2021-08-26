#!/usr/bin/env bash

version=$(curl -sL "https://api.github.com/repos/vmware-tanzu/velero-plugin-for-aws/releases/latest" | jq -r ".tag_name")
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
          