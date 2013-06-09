export PATH="$HOME/.bin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:/opt/local/bin:$PATH"
  eval "$(rbenv init -)"
fi

export PATH="/usr/local/heroku/bin:$PATH"

# Aliases
alias served="python -m SimpleHTTPServer"
alias gitx="gitx -c"
alias dstroy="find . -type f -name '.DS_Store' -exec rm {} \\;"
alias be="bundle exec"
alias rs="be rails s"
alias fs="be foreman s"
alias ms="be middleman s"
alias fr="be foreman run"
alias dbm="be rake db:migrate"
alias dbr="be rake db:reset"
alias dbrb="be rake db:rollback"

function replace() {
    find . -name "$1" | xargs sed -i '' -e "$2"
}

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

source /opt/boxen/env.sh
