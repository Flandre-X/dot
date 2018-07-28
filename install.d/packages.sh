#!/usr/bin/env bash
set -uo pipefail
IFS=$'\t\n'

packages=(
cargo
#i3
neovim
npm
python
python3
python3.7
python-pip
python3-pip
ruby-dev
#zeal
zsh
zsh-doc
)

cargo_packages=(
ripgrep
)

gem_packages=(
neovim
)

npm_packages=(
neovim
)

pip_packages=(
neovim
)
pip3_packages=(
neovim
)

sudo apt install "${packages[@]}"

if command -v cargo &>/dev/null; then
    cargo install "${cargo_packages[@]}"
fi

if command -v gem &>/dev/null; then
    sudo gem install "${gem_packages[@]}"
fi

if command -v npm &>/dev/null; then
    npm install -g "${npm_packages[@]}"
fi

if command -v pip &>/dev/null; then
    pip install --user "${pip_packages[@]}"
fi
if command -v pip &>/dev/null; then
    pip3 install --user "${pip3_packages[@]}"
fi
