#!/bin/bash

# Dependencies
# fzf
# ripgrep
# Fonts
DOTFILES=$HOME/dotfiles/
STOW_FOLDERS="tmux"
# STOW_FOLDERS="bin,tmux,zsh,nvim,qtile"
pushd "$DOTFILES" || exit
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
  stow -R "$folder"
done
popd || exit
