#!/bin/bash

git config --global core.editor "nvim"

git config --global rerere.enabled true

NVIM_CONFIG_DIR=~/.config/nvim
if [ -d "$NVIM_CONFIG_DIR" ]; then
  echo "$NVIM_CONFIG_DIR does exist."
else
  git clone https://github.com/celsopalmeiraneto/kickstart.nvim.git ~/.config/nvim
fi
