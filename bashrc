export PATH="$HOME/.bin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"

export PATH="/usr/local/heroku/bin:$PATH"

# Ruby performance improvements
export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

# Colors for `ls`
export CLICOLOR=1
export LSCOLORS=FxFxCxDxBxegedabagacad

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source $HOME/.bash.d/*
