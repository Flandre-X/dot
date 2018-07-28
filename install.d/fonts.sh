#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

on_exit ()
{
    fc-cache
}
trap on_exit EXIT

font_dir="$HOME/fonts"
font_install_dir="$HOME/.local/share/fonts"
nfont_install_dir="$font_install_dir/NerdFonts"

ibm_plex_dir="$font_dir/PlexNerdfont"
ibm_plex ()
{
    local url='https://github.com/Flandre-X/PlexNerdfont'

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
    local fonts=('InconsolataGo' 'Iosevka')

    mkdir -p "$nerd_fonts_dir"
    git clone --depth 1 "$url" "$nerd_fonts_dir"
    (
	cd "$nerd_fonts_dir"
	./install.sh "${fonts[@]}"
    )
}

san_francisco_dir="$font_dir/san_francisco"
san_francisco ()
{
    local url='https://github.com/AppleDesignResources/SanFranciscoFont'

    mkdir -p "$san_francisco_dir"
    git clone --depth 1 "$url" "$san_francisco_dir"
    sf_fonts=("$san_francisco_dir"/*.otf)
    if [ ${#sf_fonts[@]} -ne 0 ]; then
	cp -t "$font_dir" "${sf_fonts[@]}"
    else
	return 1
    fi
}

if [ ! -e "$ibm_plex_dir" ]; then
    # A hack that causes the function to exit upon the first command that
    # returns non-zero while not causing the whole program to exit
    # (set -e required in function body)
    echo 'INSTALLING IBM Plex™ Nerd Font'
    set +e
    (set -e; ibm_plex)
fi
if [ ! -e "$san_francisco_dir" ]; then
    echo 'INSTALLING San Francisco font'
    set +e
    (set -e; san_francisco)
fi
if [ ! -e "$nerd_fonts_dir" ]; then
    echo 'INSTALLING Nerd Fonts (this may take a while)'
    set +e
    (set -e; nerd_fonts)
fi
