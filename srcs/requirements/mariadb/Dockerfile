FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server \
    mariadb-client 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN mkdir -p var/run/mysqld && chown mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

RUN mkdir -p /tmp/
COPY ./tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

CMD ["/tmp/start.sh"]