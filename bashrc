export PATH="$HOME/.bin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:/opt/local/bin:$PATH"
  eval "$(rbenv init -)"
fi

export PATH="/usr/local/heroku/bin:$PATH"

# Server a directory over HTTP
alias served="python -m SimpleHTTPServer"

# Open gitx in commit mode
alias gitx="gitx -c"

# Remove all .DS_Store files
alias rmds_store="find . -type f -name '.DS_Store' -exec rm {} \\;"

# tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Use vim as editor
export EDITOR=`which vim`

# https://github.com/defunkt/hub
eval "$(hub alias -s)"

# Ruby performance improvements
export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

# Colors for `ls`
export CLICOLOR=1
export LSCOLORS=FxFxCxDxBxegedabagacad

# Minimal bash prompt
export PS1="\W \[\033[01;31m\]$\[\033[00m\] "
