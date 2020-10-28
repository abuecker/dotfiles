# Enable vi movement
fish_vi_key_bindings

# update the path
set -x PATH $HOME/local/bin \
  ~/.cargo/bin \
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
nvm use 12.13.1 2&> /dev/null

#
# Docker
#
# set -gx DOCKER_HOST tcp://192.168.100.100:2376
set -xg DOCKER_HOST "unix:////var/run/docker.sock"

#
# Setup direnv
#
eval (direnv hook fish)
eval (scooter env hook fish)

# increase the open file limit
ulimit -n 10240

# The next line enables bash completion for gcloud.
# source '/Users/andybuecker/google-cloud-sdk/completion.bash.inc'

# Add firefox to the path for Selenium
set -x PATH /Applications/Firefox.app/Contents/MacOS $PATH

set -x EDITOR /usr/local/bin/nvim

# The next line updates PATH for the Google Cloud SDK.
set -x GCLOUD_SDK_PATH /Users/abuecker/local/opt/google-cloud-sdk
set -x PATH $GCLOUD_SDK_PATH/bin $PATH

# Colorized manpages
set -gx  MANPAGER "/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

source ~/.config/fish/ssh_agent_start.fish

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

set -gx FZF_DEFAULT_COMMAND "rg --files --follow --hidden -g '!.git'"
# set -xg INITIAL_QUERY ""
# set -xg RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case "
# set -xg FZF_DEFAULT_COMMAND "$RG_PREFIX '$INITIAL_QUERY'" \
#   fzf --bind "change:reload:$RG_PREFIX {q} || true" \
#       --ansi --phony --query "$INITIAL_QUERY" \
#       --height=50% --layout=reverse
