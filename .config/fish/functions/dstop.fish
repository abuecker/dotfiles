function dstop
    echo "Stopping: $argv[1]"
    docker stop (docker ps | grep $argv[1] | awk '{ print $1 }')
end
