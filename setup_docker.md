# Setup Docker Infrastructure

## Create a Git Repository
Start by creating a new Git repository to store all your Docker-related configuration and files.

## Build Directory Structure
Your project should follow this required structure:
```bash
inception/
├── Makefile
└── srcs/
    ├── docker-compose.yml
    └── requirements/
        ├── nginx/
        │   ├── .dockerignore
        │   ├── Dockerfile
        │   ├── conf/default.conf
        │   └── tools/entrypoint.sh
        ├── mariadb/
        │   ├── .dockerignore
        │   ├── Dockerfile
        │   ├── conf/mariadb-server.cnf
        │   └── tools/entrypoint.sh
        └── wordpress/
            ├── .dockerignore
	        ├── Dockerfile
            ├── conf/www.conf
            └── tools/entrypoint.sh
```
📌 Description of Components
- Makefile: Automates commands like up, down, clean, etc.
- docker-compose.yml: Defines services, volumes, and networks.
- requirements/: Contains one folder per service.
- .dockerignore: Lists files to ignore when building Docker context (optional).


## Useful Docker Compose Commands
```bash
docker-compose up --build     # Build and start all services
docker-compose down           # Stop and remove containers, networks, volumes
docker-compose start          # Start existing stopped containers
docker-compose stop           # Stop running containers
docker-compose logs           # Show logs from all services
docker system prune           # Remove unused data (containers, images, networks...)
```

## How Dockerfiles and Entrypoints Work
Each service is defined in its own Dockerfile. The setup process generally follows this flow:

- Start from a minimal Alpine Linux base image.
- Install necessary packages and dependencies.
- Copy configuration files (e.g., .conf, .php, etc.) and the entrypoint.sh script.
- When the container starts, the entrypoint script:
	- Configures the service
	- Sets permissions if needed
	- Launches the main process (like nginx, mysqld, or php-fpm)
