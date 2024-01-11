# fish_config theme choose "Rosé Pine {Dawn, Moon}"
fish_config theme choose "Rosé Pine"

# Enable vi movement
fish_vi_key_bindings

# set the default terminfo
set -gx TERM xterm-256color

# update the path
fish_add_path 
set -x PATH $HOME/local/bin \
  ~/.local/bin \
  ~/bin \
  ~/.cargo/bin \
  /usr/local/opt/openjdk/bin \
  /usr/local/bin \
  ./node_modules/.bin \
  # ~/Library/Python/2.7/bin \
  # ~/Library/Python/3.7/bin \
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
# This can be kind of slow.  Profile the startup time with:
#   fish --profile prompt.prof -ic 'fish_prompt; exit'; sort -nk 2 prompt.prof
#
bass source ~/.nvm/nvm.sh --no-use
nvm use 16.14.0 2&> /dev/null

#
# Docker
#
# set -gx DOCKER_HOST tcp://192.168.100.100:2376
set -xg DOCKER_HOST "unix:////var/run/docker.sock"

#
# Setup direnv
#
# test -n "$NVIM_LISTEN_ADDRESS" && eval (direnv hook fish)
eval (direnv hook fish)

# eval (scooter env hook fish)

# increase the open file limit
ulimit -n 10240

# The next line enables bash completion for gcloud.
# source '/Users/andybuecker/google-cloud-sdk/completion.bash.inc'
set -xg CLOUDSDK_PYTHON python2

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

set -xg BAT_THEME Nord

# Append --no-height (for neovim only)
if test -n $NVIM_LISTEN_ADDRESS
  set -xg FZF_DEFAULT_OPTS '--no-height'
end

fish_add_path /usr/local/sbin

# pyenv
fish_add_path ~/.pyenv/shims
pyenv init - | source


# The next line updates PATH for the Google Cloud SDK.
set -xg CLOUDSDK_PYTHON python3
if [ -f '/Users/abuecker/local/opt/google-cloud-sdk/path.fish.inc' ]; . '/Users/abuecker/local/opt/google-cloud-sdk/path.fish.inc'; end
