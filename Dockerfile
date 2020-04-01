FROM debian:buster
MAINTAINER fde-capu
RUN apt-get update
RUN apt-get upgrade
# nginx
RUN apt-get install nginx -y
COPY srcs/ft_server /etc/nginx/sites-available
RUN mkdir -p /var/www/ft_server/html
COPY srcs/index.html /var/www/ft_server/html
RUN rm -f /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled
# ssl
RUN apt-get install openssl -y
RUN openssl req -new -x509 -days 365 \
	-newkey rsa:2048 -passout pass:42sp \
	-subj "/C=BR/L=SP/O=42SP/CN=ft_server" \
	-keyout /etc/ssl/certs/localhost.key \
	-out /etc/ssl/certs/localhost.crt

# open ports
EXPOSE 80 443

# start nginx
CMD ["nginx", "-g", "daemon off;"]
