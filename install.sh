#!/usr/bin/env bash
# Run everything in scripts
# cd to this directory before running this

for f in install.d/*.sh; do
    [ -e "$f" ] && "$f"
done
