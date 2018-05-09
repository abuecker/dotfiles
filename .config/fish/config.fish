# Enable vi movement
fish_vi_key_bindings

alias tmux "direnv exec / tmux"

# update the path
set -x PATH $HOME/local/bin /usr/local/bin ./node_modules/.bin ~/Library/Python/2.7/bin $PATH

set -x DEVELOPMENT true

# to remove the error about the curl libcurl mismatch
# set -x DYLD_LIBRARY_PATH /usr/local/Cellar/curl/7.37.0/lib/

#
# clear the fish welcome message
#
function fish_greeting
    echo ""
    fortune
    echo ""
end

#
# source the aliases
#
source $HOME/.config/fish/aliases.fish

# setup powerline
# set fish_function_path $fish_function_path ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/fish
# powerline-setup

#
# Node Version Manager
#
# test -s /Users/andybuecker/.nvm-fish/nvm.fish; and source /Users/andybuecker/.nvm-fish/nvm.fish

#bass source ~/.nvm/nvm.sh --no-use
#test -s ~/.config/fish/nvm-wrapper/nvm.fish; and source ~/.config/fish/nvm-wrapper/nvm.fish
#nvm use 5.10.1

#
# Docker
#
# set -gx DOCKER_HOST tcp://192.168.100.100:2376
set -xg DOCKER_HOST "unix:////var/run/docker.sock"

#
# Ansible
#
#set -x ANSIBLE_PATH ~/local/usr/local/ansible
#set -x ANSIBLE_PATH ~/personal/dev/ansible
#set -gx PYTHONPATH /usr/local/lib/python2.7/site-packages
# source ~/personal/dev/ansible/hacking/env-setup.fish > /dev/null


#
# Setup RVM
#
# rvm current

#
# Setup direnv
#
eval (direnv hook fish)

#
# virtualenv support
#
#eval (python -m virtualfish)
# # set -g VIRTUALFISH_COMPAT_ALIASES # uncomment for virtualenvwrapper-style commands
# set -x VFPATH ~/.config/fish/vf
# source $VFPATH/virtual.fish
# # optional plugins
# source $VFPATH/auto_activation.fish
# # source $VFPATH/global_requirements.fish
# # source $VFPATH/projects.fish

# suace labs keys
# source ~/.keys/chef/saucelabs.fish

# increase the open file limit
ulimit -n 10240

# The next line enables bash completion for gcloud.
# source '/Users/andybuecker/google-cloud-sdk/completion.bash.inc'

# Add firefox to the path for Selenium
set -x PATH /Applications/Firefox.app/Contents/MacOS $PATH

set -x EDITOR /usr/local/bin/vim

# The next line updates PATH for the Google Cloud SDK.
set -x GCLOUD_SDK_PATH /Users/abuecker/local/opt/google-cloud-sdk
set -x PATH $GCLOUD_SDK_PATH/bin $PATH

# The next line enables shell command completion for gcloud.
# source /Users/abuecker/local/opt/google-cloud-sdk/completion.bash.inc
# rvm default

# Colorized manpages
set -gx  MANPAGER "/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

set -xg TERM tmux-256color

source ~/.config/fish/ssh_agent_start.fish
