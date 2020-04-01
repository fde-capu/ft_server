#!/bin/sh
echo plz run: newgrp docker
#docker rmi -f ft_server
docker container rm -f $(docker ps -aq)
docker build -t ft_server .
docker run -d -p 8080:80 --name ft_container \
	-p 443:443 \
	ft_server
