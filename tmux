set-option -g status on
set -g status-bg colour234
set -g window-status-activity-attr bold
set -g pane-border-fg colour245
set -g pane-active-border-fg colour39
set -g message-fg colour16
set -g message-bg colour221
set -g message-attr bold

# Custom status bar
# Powerline symbols: ⮂ ⮃ ⮀ ⮁ ⭤
set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

set -g status-left '#[fg=colour238,bg=colour234,nobold]⮀'
set -g status-right '#[fg=colour245]⮃ %R ⮃ %d %b #[fg=colour254,bg=colour234,nobold]#(rdio-current-track-tmux)⮂#[fg=colour16,bg=colour254,bold] #h '

set -g window-status-format "#[fg=white,bg=colour234] #I #W "
set -g window-status-current-format "#[fg=colour234,bg=colour39]⮀#[fg=colour16,bg=colour39,noreverse,bold] #I ⮁ #W #[fg=colour39,bg=colour234,nobold]⮀"
set -s escape-time 0

set -g default-terminal "screen-256color"

# Activity
setw -g monitor-activity on
set -g visual-activity off


# Mouse stuff                                                                   
setw -g mode-mouse on                                                           
setw -g mouse-select-window on                                                  
setw -g mouse-select-pane on                                                    
setw -g mouse-resize-pane on

# screen ^C c
unbind ^C
bind ^C new-window
bind c new-window

# detach ^D d
unbind ^D
bind ^D detach

# quit \
unbind x
bind x kill-server

# Next window
unbind ^B
bind ^B select-pane -t :.+