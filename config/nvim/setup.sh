#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

ale_linters ()
{
    sudo apt install $(cat linters)
    sudo apt install python-pip python3-pip
    # TODO Install Python 3 linters
    pip install vim-vint
}

instant_markdown ()
{
    sudo apt install npm xdg-utils curl
    sudo npm -g install instant-markdown-d
    local tmp_dir=$(mktemp -d)
    git clone https://github.com/suan/vim-instant-markdown "$tmp_dir"
    mkdir -p after/ftplugin/markdown
    mv "$tmp_dir"/after/ftplugin/markdown/* -t after/ftplugin/markdown
}

packages ()
{
    sudo apt install $(cat packages)
}

nerd_fonts ()
{
    local nerd_fonts_url='https://github.com/ryanoasis/nerd-fonts'
    local nerd_fonts_dir="$HOME/github/fonts/nerd-fonts"
    local fonts=('Inconsolata Go' 'Iosevka')

    [ -d "$nerd_fonts_dir" ] && [ -e "$nerd_fonts_dir/patched-fonts" ] && return 0

    mkdir -p "$nerd_fonts_dir"
    git clone --depth 1 "$nerd_fonts_url" "$nerd_fonts_dir"
    "$nerd_fonts_dir/install.sh" ${fonts[*]}
}

! packages

! ale_linters
! instant_markdown
! nerd_fonts
