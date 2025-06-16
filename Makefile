DATA_DIR 		= ./data
MYSQL_DIR 		= $(DATA_DIR)/mysql
WP_DIR 			= $(DATA_DIR)/wordpress

COMPOSE_FILE 	= ./srcs/docker-compose.yml
ENV_FILE 		= ./srcs/.env
DC 				= docker-compose --env-file $(ENV_FILE) --file $(COMPOSE_FILE)

all: up

mkdirs:
	@mkdir -p $(MYSQL_DIR) $(WP_DIR)

up : mkdirs
	$(DC) up

down :
	$(DC) down --remove-orphans

stop :
	$(DC) stop

start :
	$(DC) start

re : clean mkdirs
	$(DC) up --build

loggs:
	$(DC) logs --follow

clean :
	$(DC) down --volumes --remove-orphans
	docker volume prune -f
	@sudo rm -rf $(DATA_DIR)

.PHONY : all up down stop start re logs clean mkdirs
