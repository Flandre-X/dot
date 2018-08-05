#!/usr/bin/env bash
# Run everything in scripts
# Make sure your CWD is the same as this file's containing directory
set -euo pipefail
IFS=$'\t\n'

scripts=(
packages.sh
links.sh
vim-plug.sh
fzf.sh
fonts.sh
themes.sh
#i3-gaps.sh
)

for f in "${scripts[@]}"; do
    script="install.d/$f"
    [ -x "$script" ] && "$script"
done

chsh -s zsh
