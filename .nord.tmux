# Copyright (c) 2016-present Sven Greb <development@svengreb.de>
# This source code is licensed under the MIT license found in the license file.

#+----------------+
#+ Plugin Support +
#+----------------+
#+--- tmux-prefix-highlight ---+
set -g @prefix_highlight_fg black
set -g @prefix_highlight_bg brightcyan

#+---------+
#+ Options +
#+---------+
set -g status-interval 1
set -g status on

#+--------+
#+ Status +
#+--------+
#+--- Layout ---+
set -g status-justify left

#+--- Colors ---+
set -g status-style bg=black,fg=white

#+-------+
#+ Panes +
#+-------+
set -g pane-border-style bg=default,fg=brightblack
set -g pane-active-border-style bg=default,fg=blue
set -g display-panes-colour black
set -g display-panes-active-colour brightblack

#+------------+
#+ Clock Mode +
#+------------+
setw -g clock-mode-colour cyan

#+----------+
#+ Messages +
#+---------+
set -g message-style bg=brightblack,fg=cyan
set -g message-command-style bg=brightblack,fg=cyan


#+----------------+
#+ Plugin Support +
#+----------------+
#+--- tmux-prefix-highlight ---+
set -g @prefix_highlight_output_prefix "#[fg=brightcyan]#[bg=black]#[nobold]#[noitalics]#[nounderscore]#[bg=brightcyan]#[fg=black]"
set -g @prefix_highlight_output_suffix ""
set -g @prefix_highlight_copy_mode_attr "fg=brightcyan,bg=black,bold"

#+--------+
#+ Status +
#+--------+
#+--- Bars ---+
set -g status-left "#[fg=black,bg=blue,bold] #S #[fg=blue,bg=black,nobold,noitalics,nounderscore]"
set -g status-right "#{prefix_highlight}#[fg=brightblack,bg=black,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %b %d %Y #[fg=white,bg=brightblack,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %l:%M %p  #{battery_status_fg} #{battery_icon} #{battery_percentage} #{battery_remain} #[fg=cyan,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=cyan,bold] #H "
set -g @batt_remain_short true

# set -g status-right "Continuum status: #{continuum_status}  #{prefix_highlight}#[fg=brightblack,bg=black,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %b %d %Y #[fg=white,bg=brightblack,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %l:%M %p #[fg=cyan,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=cyan,bold] #H "

#+--- Windows ---+
set -g window-status-format "#[fg=black,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#I #[fg=white,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#W #F #[fg=brightblack,bg=black,nobold,noitalics,nounderscore]"
set -g window-status-current-format "#[fg=black,bg=cyan,nobold,noitalics,nounderscore] #[fg=black,bg=cyan]#I #[fg=black,bg=cyan,nobold,noitalics,nounderscore] #[fg=black,bg=cyan]#W #F #[fg=cyan,bg=black,nobold,noitalics,nounderscore]"
set -g window-status-separator ""
