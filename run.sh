#!/bin/sh

# Generate a self signed SSL certificate
openssl req -new -x509 -days 365 \
	-newkey rsa:2048 -nodes \
	-subj "/C=BR/L=SP/O=42SP/CN=localhost" \
	-keyout srcs/localhost.key \
	-out srcs/localhost.crt

# Builds image
docker build -t ft_server .

# Run container
docker run -d -p 8080:80 -p 8081:443 -p 443:443 --name ft_container ft_server
