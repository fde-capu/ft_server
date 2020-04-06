#!/bin/sh

# Reatake container from apt-installed 
docker run -d -p 80:80 -p 443:443 \
	-v "/$(pwd)/srcs/autoindex:/var/www/ft_server/html/autoindex" \
	--name ft_container fde-capu_ft_server

# Just for verbose sake
docker ps
docker logs ft_container
