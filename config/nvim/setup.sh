#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

linters=(shellcheck)
packages=(build-essential cmake exuberant-ctags python-dev python-pip python3-dev python3-pip)

ale_linters ()
{
    sudo apt install "${linters[@]}"
    sudo apt install python-pip python3-pip
    # TODO Install Python 3 linters
    pip install vim-vint
}

install_packages ()
{
    sudo apt install "${packages[@]}"
}

install_packages

! ale_linters
true
