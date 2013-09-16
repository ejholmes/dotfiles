#!/usr/bin/env bash

echo "initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
rm -f ~/.vimrc
rm -f ~/.vim
rm -f ~/.gitconfig
rm -f ~/.gitignore
rm -f ~/.tmux.conf
rm -f ~/.gemrc
rm -f ~/.irbrc
rm -f ~/.psqlrc
rm -f ~/.railsrc
rm -f ~/.railstemplate.rb
rm -rf ~/.js

echo "Symlinking files"
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/vim ~/.vim
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/gitignore ~/.gitignore
ln -s $PWD/tmux ~/.tmux.conf
ln -s $PWD/gemrc ~/.gemrc
ln -s $PWD/irbrc ~/.irbrc
ln -s $PWD/psqlrc ~/.psqlrc
ln -s $PWD/railsrc ~/.railsrc
ln -s $PWD/railstemplate.rb ~/.railstemplate.rb
ln -s $PWD/dotjs ~/.js
ln -s $PWD/bash.d ~/.bash.d

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "Installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c "execute \"BundleInstall\" | q | q"

echo "All done."
