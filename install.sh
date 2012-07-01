#!/usr/bin/env bash

echo "initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
rm ~/.vimrc
# rm ~/.zshrc
# rm ~/.vim
rm ~/.gitconfig
rm ~/.gitignore
# rm ~/.tmux.conf

echo "Symlinking files"
ln -s ~/Source/dotfiles/vimrc ~/.vimrc
# ln -s ~/Source/dotfiles/zshrc ~/.zshrc
# ln -s ~/Source/dotfiles/vim ~/.vim
ln -s ~/Source/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Source/dotfiles/gitignore ~/.gitignore
# ln -s ~/Source/dotfiles/tmux ~/.tmux.conf

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done."
