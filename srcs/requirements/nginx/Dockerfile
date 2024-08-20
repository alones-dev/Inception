FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    nginx \
    openssl

RUN rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
COPY ./conf/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=kdaumont.42.fr/CN=kdaumont.42.fr/UID=kdaumont"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]