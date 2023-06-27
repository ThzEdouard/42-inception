# create container docker debian buster 
FROM debian:buster

# upgrade, install package for the nginx and protocol TSL
RUN apt update -y && \ 
    apt upgrade -y && \
    apt install mariadb-server -y 

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/setup.sh /setup.sh

RUN chmod 777 setup.sh

EXPOSE 3306

CMD ["sh", "setup.sh"]