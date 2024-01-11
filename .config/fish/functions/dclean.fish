function dclean --description 'Clean up leftover docker runs'
	docker rm -f (docker ps -qa)
end
