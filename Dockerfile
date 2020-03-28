FROM debian:buster
MAINTAINER fde-capu
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install nginx -y
COPY srcs/ft_server /etc/nginx/sites-available
RUN mkdir -p /var/www/ft_server/html
COPY srcs/index.html /var/www/ft_server/html
RUN rm -f /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
