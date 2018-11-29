# Defined in /var/folders/f7/qvnvlp154mv944lgt4v047680000gn/T//fish.TYnrsk/maya.fish @ line 2
function maya --description 'Maya Alias'
	if count $argv > /dev/null
    /Applications/Autodesk/maya2018/Maya.app/Contents/MacOS/Maya -file $argv -proj $PWD
  else
    /Applications/Autodesk/maya2018/Maya.app/Contents/MacOS/Maya -proj $PWD
  end
end
