#!/usr/bin/env bash
echo "Downloading latest Bitwarden release..."
curl -Ls \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/bitwarden/clients/releases/latest | jq -r '.assets[] | select(.name | endswith(".rpm")) | .browser_download_url' | dnf install -y $(</dev/stdin)

