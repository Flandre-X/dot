#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

theme_dir="$HOME/github/themes"
theme_install_dir="/usr/share/themes"

mac_theme_dir="$theme_dir/Sierra"
mac_theme ()
{
    echo 'Not implemented'
}

if [ ! -e "$mac_theme_dir" ]; then
    set +e
    ( set -e; mac_theme )
fi
