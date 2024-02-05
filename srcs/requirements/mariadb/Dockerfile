FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 3306

CMD ["sh", "/setup.sh"]
