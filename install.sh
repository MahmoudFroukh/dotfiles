#!/bin/bash
# install.sh - symlink dotfiles into ~/.config

CONFIGS=(alacritty fastfetch ghostty nvim starship)

for conf in "${CONFIGS[@]}"; do
  target="$HOME/.config/$conf"
  source="$HOME/dotfiles/$conf"

  if [ -d "$target" ] || [ -L "$target" ]; then
    echo "Skipping $conf - already exists"
  else
    ln -s "$source" "$target"
    echo "Linked $conf"
  fi
done
