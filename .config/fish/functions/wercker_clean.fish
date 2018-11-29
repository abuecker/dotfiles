# Defined in /var/folders/f7/qvnvlp154mv944lgt4v047680000gn/T//fish.OycbGi/wercker_clean.fish @ line 1
function wercker_clean
	for f in (find ~ -type d -name ".wercker")
    echo $f
    rm -rf $f
  end
end
