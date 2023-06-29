# Utilisez l'image de base Debian Buster
FROM debian:buster

# Mettez à jour les paquets du système
RUN apt-get update && apt-get upgrade -y

# Installez Nginx, OpenSSL et les outils nécessaires
RUN apt-get install -y nginx openssl

# Créez un répertoire pour les certificats SSL
RUN mkdir -p /etc/nginx/ssl

# Générez la clé SSL à l'intérieur du conteneur
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key -subj \
    "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=eflaquet.42.fr/UIS=eflaquet"

# Copiez le fichier de configuration nginx.conf
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Exposez le port 443 pour le trafic HTTPS
EXPOSE 443

# Démarrez Nginx
CMD ["nginx", "-g", "daemon off;"]
