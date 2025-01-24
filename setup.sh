#!/bin/bash

set -euo pipefail

FILES=".bashrc .gitconfig .gitignore_global"

DOTFILES=$(cd $(dirname $0) && pwd)

for f in $FILES; do
  ln -sfv $DOTFILES/$f ~/
done

mkdir -p ~/.config
ln -sfv $DOTFILES/.config/nvim ~/.config/

git submodule update --init

PREFIX=/usr/local

if ! which nvim; then
  echo "Installing neovim"
  curl -sSL https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz | sudo tar xz -C "$PREFIX"
  sudo ln -sf "$PREFIX/nvim-linux64/bin/nvim" "$PREFIX/bin"
  echo "Installed: $(nvim --version)"
fi

if ! which fzf; then
  echo "Installing fzf"
  curl -sSL https://github.com/junegunn/fzf/releases/download/v0.58.0/fzf-0.58.0-linux_amd64.tar.gz \
    | sudo tar xz -C "$PREFIX/bin"
  echo "Installed: $(fzf --version)"
fi
