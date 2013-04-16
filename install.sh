#!/usr/bin/env bash

echo "initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
rm -f ~/.vimrc
rm -f ~/.bashrc
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
ln -s ~/Source/dotfiles/vimrc ~/.vimrc
ln -s ~/Source/dotfiles/bashrc ~/.bash_profile
ln -s ~/Source/dotfiles/vim ~/.vim
ln -s ~/Source/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Source/dotfiles/gitignore ~/.gitignore
ln -s ~/Source/dotfiles/tmux ~/.tmux.conf
ln -s ~/Source/dotfiles/gemrc ~/.gemrc
ln -s ~/Source/dotfiles/irbrc ~/.irbrc
ln -s ~/Source/dotfiles/psqlrc ~/.psqlrc
ln -s ~/Source/dotfiles/railsrc ~/.railsrc
ln -s ~/Source/dotfiles/railstemplate.rb ~/.railstemplate.rb
ln -s ~/Source/dotfiles/dotjs ~/.js

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "Installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c "execute \"BundleInstall\" | q | q"

echo "All done."
