# Enable vi movement
fish_vi_key_bindings

# alias tmux "direnv exec / tmux"

# update the path
set -x PATH $HOME/local/bin \
  /usr/local/bin \
  ./node_modules/.bin \
  ~/Library/Python/2.7/bin \
  ~/Library/Python/3.7/bin \
  /Applications/Autodesk/maya2018/Maya.app/Contents/bin \
  ~/.local/bin \
  $PATH

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

#
# Node Version Manager
#
bass source ~/.nvm/nvm.sh --no-use
nvm use 10.5.0

#
# Docker
#
# set -gx DOCKER_HOST tcp://192.168.100.100:2376
set -xg DOCKER_HOST "unix:////var/run/docker.sock"

#
# Setup direnv
#
eval (direnv hook fish)

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

# Colorized manpages
set -gx  MANPAGER "/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

source ~/.config/fish/ssh_agent_start.fish
