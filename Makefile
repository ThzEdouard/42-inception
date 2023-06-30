up:
	sudo docker-compose -f ./src/docker-compose.yml up --build -d

down:
	sudo docker-compose -f ./src/docker-compose.yml down

clean:
	sudo docker system prune

show:
	sudo docker ps
	sudo docker volume ls -q
	sudo docker container ls -q

renew:
	make down
	sudo docker volume rm src_mariadb
	sudo docker volume rm src_wordpress
	sudo rm -rf /home/debian/data/wp-website/*
	sudo rm -rf /home/debian/data/wp-database/*
	

logs:
	sudo docker logs wordpress
	sudo docker logs mariadb
	sudo docker logs nginx

restart:
	make down
	make up

.PHONY: up down clean show renew logs restart