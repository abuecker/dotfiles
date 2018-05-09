function urldecode
	python -c "import sys, urllib as ul; print ul.unquote_plus(sys.stdin.readlines()[0].strip())"
end
