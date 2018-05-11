#!/usr/bin/env bash
# Run everything in scripts
# Make sure your CWD is the same as this file's containing directory

for f in install.d/*.sh; do
    [ -e "$f" ] && "$f"
done
