#!/bin/sh
openssl req -new -x509 -nodes -days 365 \
	-newkey rsa:2048 -passout pass:42sp \
	-subj "/C=BR/L=SP/O=42SP/CN=ft_server" \
	-keyout srcs/localhost.key \
	-out srcs/localhost.crt
docker container rm -f $(docker ps -aq)
docker build -t ft_server .
docker run -d -p 8080:80 -p 443:443 --name ft_container ft_server
