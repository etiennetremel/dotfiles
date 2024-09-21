#!/usr/bin/env bash

set -e

DOTFILES=$HOME/dotfiles

# echo "Installing dependencies..."
# brew install \
#   fg \
#   ripgrep \
#   fzf \
#   zsh-autosuggestions \
#   zsh-history-substring-search \
#   starship \
#   luarocks \
#   taplo \
#   neovim
#
# echo "Installing python dependencies..."
# python3 -m pip install --user --upgrade pynvim
#
# echo "Installing themes..."
# git clone https://github.com/alacritty/alacritty-theme alacritty/themes
#
# echo "Installing dotfiles..."

echo "
Creating symlinks
==================================="
ln -s $DOTFILES/alacritty/ ~/.config/alacritty
ln -s $DOTFILES/nvim/ ~/.config/nvim
ln -s $DOTFILES/tmux.conf ~/.tmux.conf

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
