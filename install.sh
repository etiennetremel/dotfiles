#!/bin/bash

PWD=$(pwd)
ZSH=$PWD/zsh
VIM=$PWD/vim

echo "Installing dotfiles"

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Initializing submodule(s)"
git submodule update --init --recursive

echo "Initialise pure $ZSH/plugins/pure/pure.zsh"
ln -s "$ZSH/plugins/pure/pure.zsh" /usr/share/zsh/site-functions/prompt_pure_setup
ln -s "$ZSH/plugins/pure/async.zsh" /usr/share/zsh/site-functions/async

source install/link.sh

vim +PlugClean
# mkdir -p $VIM/vim.symlink/colors
# git clone https://github.com/VundleVim/Vundle.vim.git $VIM/vim.symlink/base16
# cp $VIM/vim.symlink/base16/colors/*.vim $VIM/vim.symlink


echo "Done."
