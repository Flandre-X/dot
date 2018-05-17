#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

on_exit ()
{
    fc-cache
}
trap on_exit EXIT

font_dir="$HOME/github/fonts"
font_install_dir="$HOME/.local/share/fonts"
nfont_install_dir="$font_install_dir/NerdFonts"

ibm_plex_dir="$font_dir/PlexNerdfont"
ibm_plex ()
{
    local url='https://github.com/sgolovine/PlexNerdfont'

    mkdir -p "$ibm_plex_dir"
    git clone --depth 1 "$url" "$ibm_plex_dir"
    (
	cd "$ibm_plex_dir"
	cp -t "$nfont_install_dir" patched/otf/*
    )
}

nerd_fonts_dir="$font_dir/nerd-fonts"
nerd_fonts ()
{
    local url='https://github.com/ryanoasis/nerd-fonts'
    local fonts=('Inconsolata Go' 'Iosevka')

    mkdir -p "$nerd_fonts_dir"
    git clone --depth 1 "$url" "$nerd_fonts_dir"
    (
	cd "$nerd_fonts_dir"
	./install.sh "${fonts[@]}"
    )
}

if [ ! -e "$ibm_plex_dir" ]; then
    # A hack that causes the function to exit upon the first command that
    # returns non-zero while not causing the whole program to exit
    # (set -e required in function body)
    set +e
    (set -e; ibm_plex)
fi
if [ ! -e "$nerd_fonts_dir" ]; then
    set +e
    (set -e; nerd_fonts)
fi
