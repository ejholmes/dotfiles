export POW_DOMAINS="remind101.dev,dev,ejholmes.ngrok.com"

export GOROOT=`go env GOROOT`
export GOPATH="$HOME/go"

export PATH="$GOPATH/bin:$GOROOT/bin:$HOME/.bin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Ruby performance improvements
export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

# Colors for `ls`
export CLICOLOR=1
export LSCOLORS=FxFxCxDxBxegedabagacad

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

for f in $HOME/.bash.d/*; do source $f; done

set -o vi
