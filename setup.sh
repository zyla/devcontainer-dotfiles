#!/bin/bash

FILES=".bashrc .gitconfig .gitignore_global"

DOTFILES=$(cd $(dirname $0) && pwd)

for f in $FILES; do
  ln -sf $DOTFILES/$f ~/
done

mkdir -p ~/.config
ln -sf $DOTFILES/.config/nvim ~/.config/
