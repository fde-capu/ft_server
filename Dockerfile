FROM debian:buster
MAINTAINER fde-capu
RUN apt-get update
RUN apt-get upgrade
# nginx
RUN apt-get install nginx -y
RUN mkdir -p /var/www/ft_server/html
COPY srcs/index.html /var/www/ft_server/html
COPY srcs/ft_server /etc/nginx/sites-available
RUN rm -f /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled
# ssl
COPY srcs/localhost.key /etc/ssl/certs/
COPY srcs/localhost.crt /etc/ssl/certs/
RUN chmod 600 /etc/ssl/certs/localhost*

# open ports
EXPOSE 80 443

# start nginx
CMD ["nginx", "-g", "daemon off;"]
