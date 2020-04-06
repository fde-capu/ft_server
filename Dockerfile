# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fde-capu <fde-capu@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/02 16:42:30 by fde-capu          #+#    #+#              #
#    Updated: 2020/04/06 14:54:28 by fde-capu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
LABEL maintainer=fde-capu

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install apt-utils -y
RUN apt-get upgrade -y

# nginx
RUN apt-get install nginx -y
RUN mkdir -p /var/www/ft_server/html
RUN rm -f /etc/nginx/sites-enabled/default
COPY srcs/index.html /var/www/ft_server/html/index.html
COPY srcs/ft_server /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled

# SSL
COPY srcs/localhost.* /etc/ssl/certs/
RUN chmod 600 /etc/ssl/certs/localhost*

# PHP
RUN apt-get install php php-fpm -y
RUN mkdir -p /var/www/ft_server/html/php
COPY srcs/index.php /var/www/ft_server/html/php/index.php

# MySQL / MariaDB
RUN apt-get install mariadb-server mariadb-client -y
#COPY srcs/my.cnf /root/.my.cnf
RUN mkdir -p /var/www/ft_server/html/mariadb
COPY srcs/mayadb-index.html /var/www/ft_server/html/mariadb/index.php

# PHPMyAdmin

# WordPress
#RUN apt-get install wordpress -y

# tell users that these ports are in use
EXPOSE 80 443

# start services
COPY srcs/start_ft_server.sh /
ENTRYPOINT ["bash", "/start_ft_server.sh"]
