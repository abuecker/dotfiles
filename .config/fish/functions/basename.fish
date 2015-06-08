function basename --description 'Returns the basename of a file'
	echo $argv | awk -F '.' '{print $1}'
end
