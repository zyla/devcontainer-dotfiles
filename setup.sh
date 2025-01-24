#!/bin/bash

set -euo pipefail

FILES=".bashrc .gitconfig .gitignore_global"

DOTFILES=$(cd $(dirname $0) && pwd)

for f in $FILES; do
  ln -sfv $DOTFILES/$f ~/
done

mkdir -p ~/.config
ln -sfv $DOTFILES/.config/nvim ~/.config/

if ! nvim --version; then
  mkdir -p ~/.local/bin
  curl -sSL https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz | tar xz -C ~/.local
  ln -sf ~/.local/nvim-linux64/bin/nvim ~/.local/bin
fi

nvim +PlugInstall +qall
nvim '+CocInstall -sync coc-rust-analyzer coc-json coc-tsserver coc-pyright' +qall
