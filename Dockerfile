# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fde-capu <fde-capu@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/02 16:42:30 by fde-capu          #+#    #+#              #
#    Updated: 2020/04/04 20:34:53 by fde-capu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
MAINTAINER fde-capu

RUN apt-get update
RUN apt-get upgrade

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

# MySQL / MariaDB
RUN apt-get install mariadb-server -y
COPY srcs/my.cnf ~/.my.cnf

# PHP

# WordPress

# tell users that these ports are in use
EXPOSE 80 443

# start services
COPY srcs/start_ft_server.sh /
CMD ["bash", "/start_ft_server.sh"]
