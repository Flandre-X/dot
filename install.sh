#!/usr/bin/env bash
# Run everything in scripts
# cd to this directory before running this

src_dir="$(pwd)"
dest_dir="$HOME"
for f in "$(cat to-install)"; do
    src="$src_dir/$f"
    dest="$dest_dir/.$f"
    [ -e "$dest" ] && cp "$dest" "$dest.bak"
    ln -sf "$src" "$dest"
done

for f in install.d/*.sh; do
    [ -e "$f" ] && "$f"
done
