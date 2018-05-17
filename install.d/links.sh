#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

msg() { t=$1; shift; printf '%s: %s\n' "$t" "$@"; }

_ln_home() {
    [ -z "$2" ] && tgt="$HOME/$1" || tgt="$HOME/$2"
    src="$PWD/$1"
    [ -e "$tgt.bak" ] && rm "$tgt.bak"
    [ -e "$tgt" ] && mv "$tgt" "$tgt.bak"
    ln -sf "$src" "$tgt"
}

for d in config/*; do
    msg 'LINK DIR' "$(basename "$d")"
    _ln_home "$d" ".$d" || echo "FAIL"
done

while read f; do
    msg 'LINK FILE' "$(basename "$f")"
    _ln_home "$f" ".$f" || echo "FAIL"
done <to-install
