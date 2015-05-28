set-option -g default-command "reattach-to-user-namespace -l bash"
set-option -g base-index 1
set-window-option -g pane-base-index 1
set-option -g status on
set -g status-bg colour234
set -g window-status-activity-attr bold
set -g pane-border-fg colour245
set -g pane-active-border-fg colour39
set -g message-fg colour16
set -g message-bg colour221
set -g message-attr bold

set -g status-bg '#666666'
set -g status-fg '#aaaaaa'

set -s escape-time 0

set -g default-terminal "screen-256color"

# start selecting text typing 'v' key (once you are in copy mode)
bind-key -t vi-copy v begin-selection
# copy selected text to the system's clipboard
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# Status bar
# colors
set -g status-bg black
set -g status-fg white

# alignment
set-option -g status-justify centre

# spot at left
set-option -g status-left '#[bg=black,fg=green][#[fg=cyan]#S#[fg=green]]'
set-option -g status-left-length 20

# window list
setw -g automatic-rename on
set-window-option -g window-status-format '#[dim]#I:#[default]#W#[fg=grey,dim]'
set-window-option -g window-status-current-format '#[fg=cyan,bold]#I#[fg=blue]:#[fg=cyan]#W#[fg=dim]'

# spot at right
set -g status-right '#[fg=green][#[fg=cyan]%Y-%m-%d#[fg=green]]'

# Activity
setw -g monitor-activity on
set -g visual-activity off

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
