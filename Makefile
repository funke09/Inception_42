NAME = inception

all:
	@mkdir -p /home/zcherrad/data/mariadb
	@mkdir -p /home/zcherrad/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

build:
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

start:
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env start

stop:
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env stop

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

re: down
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

clean: down
	@docker system prune -a
	@sudo rm -rf ~/data

fclean:
	@docker stop $$(docker ps -aq)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data

