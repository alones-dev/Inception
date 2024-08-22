#!/bin/bash

sleep 10

cd /var/www/html

if [ -f ./wp-config.php ]
then
    echo "Already install"
else
    wp core download --allow-root
    wp config create --allow-root \
        --dbhost=$SQL_HOSTNAME \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD
    wp core install --allow_root \
        --url=https://$WP_DOMAIN \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email
fi

chown -R www-data:www-data /var/www/html

php-fpm7.4 -F -R