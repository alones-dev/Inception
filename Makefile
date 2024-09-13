MARIADB=/home/kdaumont/data/mariadb
WORDPRESS=/home/kdaumont/data/wordpress

all: build up

setup:
	mkdir -p $(MARIADB)
	mkdir -p $(WORDPRESS)

build:
	docker compose -f srcs/docker-compose.yml build

up: setup
	docker compose -f srcs/docker-compose.yml up 

down:
	docker compose -f srcs/docker-compose.yml down --volumes

fclean: down
	sudo rm -rf $(MARIADB)
	sudo rm -rf $(WORDPRESS)

re: fclean all
