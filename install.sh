#!/usr/bin/env bash
# Run everything in scripts
# Make sure your CWD is the same as this file's containing directory
set -euo pipefail
IFS=$'\t\n'

for f in install.d/*.sh; do
    [ -x "$f" ] && "$f"
done
