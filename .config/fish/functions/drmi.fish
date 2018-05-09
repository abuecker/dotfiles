function drmi --description 'Remove all docker images'
	docker rmi (docker images | awk 'FNR >1 {print $3}')
end
