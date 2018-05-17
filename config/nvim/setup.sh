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

instant_markdown ()
{
    sudo apt install npm xdg-utils curl
    sudo npm -g install instant-markdown-d

    local tmp_dir
    tmp_dir=$(mktemp -d)
    git clone https://github.com/suan/vim-instant-markdown "$tmp_dir"
    mkdir -p after/ftplugin/markdown
    mv "$tmp_dir"/after/ftplugin/markdown/* -t after/ftplugin/markdown
}

install_packages ()
{
    sudo apt install "${packages[@]}"
}

install_packages

! ale_linters
! instant_markdown
