function settitle --description 'change description of tmux tab'
	if test -n $TMUX
    if test -e .git
      # echo (string split -r "/" (pwd))[-1]
      printf \033k(string split -r "/" (pwd))[-1]\033\\
    end
  end
end
