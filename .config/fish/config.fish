# update the path
set -x PATH $HOME/local/bin /usr/local/bin ./node_modules/.bin $PATH

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
source ~/.config/fish/powerline-setup.fish
powerline-setup

#
# Node Version Manager
#
# test -s /Users/andybuecker/.nvm-fish/nvm.fish; and source /Users/andybuecker/.nvm-fish/nvm.fish
test -s ~/.config/fish/nvm-wrapper/nvm.fish; and source ~/.config/fish/nvm-wrapper/nvm.fish
# nvm use v0.10.35

#
# Docker
#
# set -x DOCKER_HOST tcp://127.0.0.1:4243

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
rvm current

#
# Setup direnv
#
eval (direnv hook fish)

#
# Setup Java Runtime
#
set -x JAVA_HOME /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home

#
# virtualenv support
#
# set -g VIRTUALFISH_COMPAT_ALIASES # uncomment for virtualenvwrapper-style commands
set -x VFPATH ~/.config/fish/vf
source $VFPATH/virtual.fish
# optional plugins
source $VFPATH/auto_activation.fish
# source $VFPATH/global_requirements.fish
# source $VFPATH/projects.fish

# suace labs keys
source ~/.keys/chef/saucelabs.fish

# increase the open file limit
ulimit -n 10240

set -x BS_USERNAME andybuecker1
set -x BS_AUTHKEY rszpm3t6trZP1sCdqwUM

# The next line updates PATH for the Google Cloud SDK.
set -x PATH  ~/google-cloud-sdk/bin $PATH

# The next line enables bash completion for gcloud.
# source '/Users/andybuecker/google-cloud-sdk/completion.bash.inc'
