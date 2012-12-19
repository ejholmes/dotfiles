#!/usr/bin/env zsh

successfully() {
  $* || (echo "failed" 1>&2 && exit 1)
}

echo "Fixing permissions ..."
  successfully sudo chown -R `whoami` /usr/local

echo "Installing libksba, recommended for Ruby 1.9.3 ..."
  successfully brew install libksba

echo "Installing Postgres, a good open source relational database ..."
  successfully brew install postgres --no-python
  successfully initdb /usr/local/var/postgres -E utf8

echo "Installing Redis, a good key-value database ..."
  successfully brew install redis

echo "Installing ack, for searching the contents of files ..."
  successfully brew install ack

echo "Installing ctags, for indexing files for vim tab completion of methods, classes, variables ..."
  successfully brew install ctags

echo "Installing tmux, for saving project state and switching between projects ..."
  successfully brew install tmux

echo "Installing reattach-to-user-namespace, for copy-paste and RubyMotion compatibility with tmux ..."
  successfully brew install reattach-to-user-namespace

echo "Installing ImageMagick, for cropping and re-sizing images ..."
  successfully brew install imagemagick

echo "Installing watch, used to execute a program periodically and show the output ..."
  successfully brew install watch

echo "Installing rbenv ruby-build and Ruby 1.9.3-p327, which becomes the default ..."
  successfully brew install rbenv
  successfully brew install ruby-build
  eval $(rbenv init -)
  successfully rbenv install 1.9.3-p327

echo "Install phantomjs for running JavaScript headlessly ..."
  successfully brew install phantomjs

echo "Installing standalone Heroku CLI client. You'll need administrative rights on your machine ..."
  successfully curl -s https://toolbelt.heroku.com/install.sh | sh
