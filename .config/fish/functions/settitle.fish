# Defined in /var/folders/f7/qvnvlp154mv944lgt4v047680000gn/T//fish.WYtuje/settitle.fish @ line 2
function settitle --description 'change description of tmux tab'
	#if test -n $TMUX
  if string match -q "tmux*" $TERM
    # echo (string split -r "/" (pwd))[-1]
    # printf \033k(string split -r "/" (pwd))[-1]\033\\
    set URL (git config --local --get remote.origin.url 2>/dev/null)
    if test $status -eq 0
      set REPO_NAME (string split -r '/' $URL)[-1]
      set NAME_ONLY (string split -r '.git' $REPO_NAME)
      tmux rename-window "$NAME_ONLY"
    end
  end
end
