#!/usr/bin/env bash

set -e

DOTFILES=$HOME/dotfiles

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing dotfiles..."

echo "
Creating symlinks
==================================="
mkdir -p ~/.config

ln -s $DOTFILES/ghostty/ ~/.config
ln -s $DOTFILES/nvim/ ~/.config
ln -s $DOTFILES/herdr/config.toml ~/.config/herdr/config.toml
ln -s $DOTFILES/pi/agent/settings.json ~/.pi/agent/settings.json
ln -s $DOTFILES/Brewfile ~/Brewfile
ln -s $DOTFILES/starship/starship.toml ~/.config/starship.toml
ln -s $DOTFILES/mise/config.toml ~/.config/mise/config.toml

echo "Installing Brew dependencies..."
brew bundle

echo "Done."
