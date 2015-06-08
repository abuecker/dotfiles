function deskhide --description='Hides the desktop'
    defaults write com.apple.finder CreateDesktop -bool false; and killall Finder
end

function deskshow --description='Shows the desktop'
    defaults write com.apple.finder CreateDesktop -bool true; and killall Finder
end

function lt
    ll -trs $argv | tail
end

function ccat
    pygmentize -g $argv
end

function psgrep
    ps aux | grep -v grep | grep $argv -i --color=auto
end

function fname
    find . -iname $argv
end
