FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    php7.4 \
    php-fpm \
    php-mysql \
    wget

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir -p /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/start.sh /var/www/start.sh
RUN chmod +x /var/www/start.sh

EXPOSE 9000

CMD ["/var/www/start.sh"]