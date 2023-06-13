NAME = inception

all:
	@sh ./srcs/requirements/tools/script.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up

build:
	@sh ./srcs/requirements/tools/script.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env build

start:
	@docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env start

stop:
	@docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env stop

down:
	@docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

clean: down
	@docker system prune -a
	@sudo rm -rf ~/data

fclean:
	@docker stop $$(docker ps -aq)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data
re: fclean all

