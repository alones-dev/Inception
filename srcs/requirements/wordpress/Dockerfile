FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    php7.3 \
    php-fpm \
    php-mysql \
    wget \

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm -rf wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/start.sh /var/www/start.sh
RUN chmod +x /var/www/start.sh

EXPOSE 9000

CMD ["/var/www/start.sh"]