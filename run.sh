#!/bin/sh
echo plz run: newgrp docker
docker rmi -f ft_server
docker container rm -f ft_container
docker build -t ft_server .
docker run -d -p 8080:80 --name ft_container ft_server
