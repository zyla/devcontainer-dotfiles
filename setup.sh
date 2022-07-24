#!/bin/bash

FILES=".bashrc .gitconfig .gitignore_global"

DOTFILES=$(dirname $0)

for f in $FILES; do
  ln -s $DOTFILES/$f ~/
done

mkdir -p ~/.config
ln -s $DOTFILES/.config/nvim ~/.config/
