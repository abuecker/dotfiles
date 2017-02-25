function dclean --description 'Clean up leftover docker runs'
	docker rm (docker ps -qa)
end
