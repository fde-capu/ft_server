FROM debian:buster
MAINTAINER fde-capu
RUN apt-get update
#RUN apt-get upgrade
# nginx
RUN apt-get install nginx -y
RUN mkdir -p /var/www/ft_server/html
RUN rm -f /etc/nginx/sites-enabled/default
COPY srcs/index.html /var/www/ft_server/html/index.html
COPY srcs/ft_server /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled
CMD srcs/server_init.sh
# ssl
COPY srcs/localhost.key /etc/ssl/certs/
COPY srcs/localhost.crt /etc/ssl/certs/
#RUN chmod 600 /etc/ssl/certs/localhost*

# open ports
EXPOSE 80 433

# start nginx
CMD ["nginx", "-g", "daemon off;"]
