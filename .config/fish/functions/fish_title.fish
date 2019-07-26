# Defined in /var/folders/f7/qvnvlp154mv944lgt4v047680000gn/T//fish.V0HrPH/fish_title.fish @ line 2
function fish_title
	set DIRNAME (pwd | awk -F '/' '{ print $NF }')
	if test -e .git -o (git rev-parse --git-dir 2> /dev/null) 2> /dev/null
    set DIRNAME (git rev-parse --show-toplevel | awk -F '/' '{ print $NF }')
  end
  echo $DIRNAME
end
