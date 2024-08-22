FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server \
    mariadb-client 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN mkdir -p /tmp/
COPY ./tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/start.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]