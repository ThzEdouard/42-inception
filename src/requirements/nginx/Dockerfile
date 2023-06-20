# create container docker debian buster 
FROM debian:buster

# upgrade, install package for the nginx and protocol TSL
RUN apt update
RUN apt upgrade
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=eflaquet.42.fr/UIS=eflaquet"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"];