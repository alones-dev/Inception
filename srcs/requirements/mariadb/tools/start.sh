#!/bin/bash

service mysql start

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" && \
mysql -u root -e "FLUSH PRIVILEGES;" && \
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" && \
mysql -u root -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" && \
mysql -u root -e "FLUSH PRIVILEGES;"

sleep 1
service mysql stop

exec "$@"