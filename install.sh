#!/usr/bin/env bash

echo "initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
rm -f ~/.vimrc
rm -f ~/.zshrc
rm -f ~/.vim
rm -f ~/.gitconfig
rm -f ~/.gitignore
rm -f ~/.tmux.conf
rm -f ~/.gemrc
rm -f ~/.irbrc

echo "Symlinking files"
ln -s ~/Source/dotfiles/vimrc ~/.vimrc
ln -s ~/Source/dotfiles/zshrc ~/.zshrc
ln -s ~/Source/dotfiles/vim ~/.vim
ln -s ~/Source/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Source/dotfiles/gitignore ~/.gitignore
ln -s ~/Source/dotfiles/tmux ~/.tmux.conf
ln -s ~/Source/dotfiles/gemrc ~/.gemrc
ln -s ~/Source/dotfiles/irbrc ~/.irbrc

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "Installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c "execute \"BundleInstall\" | q | q"

echo "All done."
