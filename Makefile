all: up

COMPOSE_FILE = ./srcs/docker-compose.yml
ENV_FILE = ./srcs/.env
DATA_DIR = ./data
MYSQL_DIR = $(DATA_DIR)/mysql
WORDPRESS_DIR = $(DATA_DIR)/wordpress

create_dirs:
	@mkdir -p $(MYSQL_DIR) $(WORDPRESS_DIR)
	@echo "Directories created or already exist."

up : create_dirs
	docker-compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) up

down :
	docker-compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) down

stop :
	docker-compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) stop

start :
	docker-compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) start

re : clean create_dirs
	docker-compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) up --build

status :
	docker ps

clean :
	docker-compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) down -v
	docker volume prune -f
	@echo "Removing data directories"
	@sudo rm -rf $(DATA_DIR)

.PHONY : all up down stop start status create_dirs
