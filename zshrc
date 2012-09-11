ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
plugins=(git extract)

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# rbenv
if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:/opt/local/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Server a directory over HTTP
alias served="ruby -r webrick -e \"require 'webrick/httputils'; mime_types = WEBrick::HTTPUtils::DefaultMimeTypes; mime_types.store 'mp4', 'video/mp4'; s = WEBrick::HTTPServer.new(:Port => 9090, :DocumentRoot => Dir.pwd, :MimeTypes => mime_types); trap('INT') { s.shutdown }; s.start\""

# Open gitx in commit mode
alias gitx="gitx -c"

# Remove all .DS_Store files
alias rmds_store="find . -type f -name '.DS_Store' -exec rm {} \\;"

# Alias z to zeus
alias z="zeus"

# tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Use vim as editor
export EDITOR=`which vim`

# https://github.com/defunkt/hub
eval "$(hub alias -s)"

export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000
