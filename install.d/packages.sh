#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

# TODO add mate?
packages=(i3 neovim zeal zsh zsh-docs)

sudo apt install "${packages[@]}"
