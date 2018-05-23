#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

rsync -a systemd/ ~/.config/systemd/
