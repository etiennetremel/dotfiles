#!/bin/bash

echo "Installing dotfiles...."

DOTFILES=$HOME/.dotfiles

echo "
Creating symlinks
==================================="
linkables=$( find -H "$DOTFILES" -maxdepth 2 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

nvim +PlugClean

echo "Done."

echo "
===================================
 Install Tmux plugins:
    1. enter tmux
    2. press CTRL + B, I
===================================
"
