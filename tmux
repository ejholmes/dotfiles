set-option -g status on
set-option -g default-command "reattach-to-user-namespace -l bash"
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
