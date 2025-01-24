#!/bin/bash

set -euo pipefail

FILES=".bashrc .gitconfig .gitignore_global"

DOTFILES=$(cd $(dirname $0) && pwd)

for f in $FILES; do
  ln -sfv $DOTFILES/$f ~/
done

mkdir -p ~/.config
ln -sfv $DOTFILES/.config/nvim ~/.config/

if ! which nvim; then
  echo "Installing neovim"
  mkdir -p ~/.local/bin
  PREFIX=/usr/local
  curl -sSL https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz | sudo tar xz -C "$PREFIX"
  sudo ln -sf "$PREFIX/nvim-linux64/bin/nvim" "$PREFIX/bin"
  echo "Installed: $(nvim --version)"
fi

nvim +PlugInstall +qall
nvim '+CocInstall -sync coc-rust-analyzer coc-json coc-tsserver coc-pyright' +qall
