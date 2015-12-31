
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/andybuecker/.travis/travis.sh ] && source /Users/andybuecker/.travis/travis.sh

export NVM_DIR="/Users/andybuecker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
