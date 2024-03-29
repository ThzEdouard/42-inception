up:
	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	sudo docker system prune

show:
	sudo docker ps
	sudo docker volume ls -q
	sudo docker container ls -q

delete:
	make down
	sudo docker volume rm srcs_mariadb
	sudo docker volume rm srcs_wordpress
	sudo docker image rm srcs_nginx
	sudo docker image rm srcs_mariadb
	sudo docker image rm srcs_wordpress
	sudo rm -rf /home/eflaquet/data/wp-website/*
	sudo rm -rf /home/eflaquet/data/wp-database/*

renew:
	make delete
	make up	

logs:
	sudo docker logs wordpress
	sudo docker logs mariadb
	sudo docker logs nginx

restart:
	make down
	make up

.PHONY: up down clean show renew logs restart delete