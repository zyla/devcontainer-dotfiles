#!/bin/bash

FILES=".bashrc .gitconfig .gitignore_global"

DOTFILES=$(dirname $0)

for f in $FILES; do
  ln -sf $DOTFILES/$f ~/
done

mkdir -p ~/.config
ln -sf $DOTFILES/.config/nvim ~/.config/
