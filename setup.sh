#!/bin/bash

FILES=".bashrc .gitconfig .gitignore_global"

DOTFILES=$(cd $(dirname $0) && pwd)

for f in $FILES; do
  ln -sfv $DOTFILES/$f ~/
done

mkdir -p ~/.config
ln -sfv $DOTFILES/.config/nvim ~/.config/

#nvim +:PlugInstall
#nvim '+:CocInstall coc-rust-analyzer coc-json'
