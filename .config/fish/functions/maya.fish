function maya --description 'Maya Alias'
	if count $argv > /dev/null
    /Applications/Autodesk/maya2017/Maya.app/Contents/MacOS/Maya -file $argv -proj $PWD
  else
    /Applications/Autodesk/maya2017/Maya.app/Contents/MacOS/Maya -proj $PWD
  end
end
