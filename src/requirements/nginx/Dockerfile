# create container docker debian buster 
FROM debian:buster

# upgrade, install package for the nginx and protocol TSL
RUN apt update -y && \
    apt upgrade -y && \
    apt install nginx -y && \
    apt install openssl -y && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -\
    keyout /etc/nginx/ssl/inception.key -subj \
    "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=eflaquet.42.fr/UIS=eflaquet" && \
    mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"];