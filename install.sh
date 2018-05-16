#!/usr/bin/env bash
# Run everything in scripts
# Make sure your CWD is the same as this file's containing directory
set -euo pipefail
IFS=$'\t\n'

scripts=(packages.sh links.sh)

for f in "${scripts[@]}"; do
    [ -x "$f" ] && "$f"
done
