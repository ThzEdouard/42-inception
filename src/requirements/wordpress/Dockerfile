# Utilisez l'image de base Debian Buster
FROM debian:buster

# Mettez à jour les paquets du système
RUN apt-get update && apt-get upgrade -y

# Installez les paquets nécessaires pour WordPress
RUN apt-get install -y wget php7.3 php-fpm php-mysql mariadb-client sendmail

# Copiez le fichier de configuration php.conf
COPY conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

# Téléchargez et extrayez WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www && \
    cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

# Installez WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Créez le répertoire pour WordPress
RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress && \
    chmod -R 755 /var/www/wordpress

# Copiez le script de configuration automatique
COPY conf/auto_config.sh /var/www/auto_config.sh

# Donnez les permissions appropriées au script
RUN chmod +x /var/www/auto_config.sh && \
    mkdir -p /run/php

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["bash", "/var/www/auto_config.sh"]
