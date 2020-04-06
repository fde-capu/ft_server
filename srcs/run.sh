#!/bin/sh

cd ..
# Generate a self signed SSL certificate
openssl req -new -x509 -days 365 \
	-newkey rsa:2048 -nodes \
	-subj "/C=BR/L=SP/O=42SP/CN=localhost" \
	-keyout srcs/localhost.key \
	-out srcs/localhost.crt

# Builds image
docker build -t ft_server .

# Run container
docker run -d -p 80:80 -p 443:443 \
	-v "/$(pwd)/srcs/autoindex:/var/www/ft_server/html/autoindex" \
	--name ft_container ft_server

# Just for verbose sake
docker ps
docker logs ft_container
