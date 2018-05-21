#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

dest=~/.local/share/nvim/site/autoload/plug.vim

if [ ! -e "$dest" ]; then
  curl -fLo "$dest/plug.vim" --create-dirs \
	      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
