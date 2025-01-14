#!/usr/bin/env bash

set -e

DOTFILES=$HOME/dotfiles

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing python dependencies..."
python3 -m pip install --user --upgrade pynvim

echo "Installing themes..."
git clone https://github.com/alacritty/alacritty-theme alacritty/themes

echo "Installing TMUX TPM..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing NVM.."
git clone https://github.com/nvm-sh/nvm.git ~/.nvm

echo "Installing dotfiles..."

echo "
Creating symlinks
==================================="
mkdir -p ~/.config

ln -s $DOTFILES/alacritty/ ~/.config
ln -s $DOTFILES/nvim/ ~/.config
ln -s $DOTFILES/tmux/tmux.conf ~/.tmux.conf
ln -s $DOTFILES/Brewfile ~/Brewfile
ln -s $DOTFILES/starship/starship.toml ~/.config/starship.toml

echo "Installing Brew dependencies..."
brew bundle

echo "Done."

echo "
===================================
 Install nvim plugins
   $ nvim
 Install Tmux plugins:
   1. enter tmux
   2. press CTRL + B, I
===================================
"
