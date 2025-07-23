function listening
  if test (count $argv) -eq 0
      sudo lsof -iTCP -sTCP:LISTEN -n -P
  else if test (count $argv) -eq 1
      sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $argv[1]
  else
      echo "Usage: listening [pattern]"
  end
end
