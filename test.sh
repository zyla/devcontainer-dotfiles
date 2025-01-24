#!/bin/bash
# TODO: interactive/noninteractive flag

set -euo pipefail

docker run --rm -it \
  -u $(id -u):$(id -g) \
  -v `pwd`:/dotfiles:z \
  -w /dotfiles \
  mcr.microsoft.com/devcontainers/base:ubuntu \
  bash -e -c '
    # Simulate how devcontainers/cli seems to do it - no stdin, no terminal
    ./setup.sh 2>&1 </dev/null | cat
    bash
  '
