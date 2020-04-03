#!/bin/bash

service nginx start
service mysql start
mysqladmin -u root password "42sp"
rm ./start_ft_server.sh
tail -f /dev/null
