# Utilisez l'image de base Debian Buster
FROM debian:buster

# Mettez à jour les paquets du système
RUN apt-get update && apt-get upgrade -y

# Installez MariaDB Server
RUN apt-get install -y mariadb-server

# Copiez le fichier de configuration 50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copiez le script de configuration et démarrez MariaDB
COPY conf/setup.sh /setup.sh
RUN chmod +x /setup.sh

# Exposez le port 3306 pour l'accès à la base de données
EXPOSE 3306

# Exécutez le script de configuration
CMD ["sh", "/setup.sh"]
