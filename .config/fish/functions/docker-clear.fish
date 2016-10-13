function docker-clear --description 'Docker clear all images'
	docker rm (docker ps -a -q)
docker rmi (docker images -q)
end
