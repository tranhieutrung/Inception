# Inception
## 🧠 Overview

The **Inception** project is part of the curriculum at 42 School. The goal is to set up a full infrastructure with Docker using a virtual machine. You will containerize several services such as **Nginx**, **WordPress**, and **MariaDB**, configure them with your own domain name, and make them interact properly through Docker Compose.

The main objective is to gain hands-on experience with system administration tools and container technologies. Everything must be built using **Docker** from scratch without using pre-built images from Docker Hub (except for Alpine as a base image).

---

## 🐳 Docker & Containers: Key Concepts

### What is Docker?

**Docker** is a platform that enables developers and system administrators to build, ship, and run applications inside containers. A **container** is a lightweight, portable, and isolated environment that packages software and all its dependencies.

### How Docker and docker-compose work

- **Docker** runs containers using **images** that are built from **Dockerfiles**.
- **Docker Compose** is a tool to manage multi-container Docker applications. It allows defining and running services using a `docker-compose.yml` file.

### The difference between a Docker image used with and without docker-compose

- **Without Docker Compose**: You must manually run containers using the `docker run` command and manually set up networks and volumes.
- **With Docker Compose**: You can define services, networks, and volumes in one YAML file and bring the whole system up with a single command (`docker-compose up`).

### The benefits of Docker compared to Virtual Machines (VMs)

| Docker                    | Virtual Machines           |
|--------------------------|----------------------------|
| Lightweight and fast     | Heavyweight and slower     |
| Uses host OS kernel      | Requires full OS           |
| Starts in seconds        | Takes minutes to boot      |
| Easier to manage         | Complex resource handling  |

🚀 How to Do and Run This Project
The project can be broken down into 3 main phases:

1️⃣ VM Setup: build and configure a Virtual Machine (Alpine Linux) [**Setup VM**](https://github.com/tranhieutrung/Inception/blob/main/setupVM.md)

2️⃣ Build Docker Infrastructure: Create a Git repository and structure the project as required by the subject [**Setup Docker**](https://github.com/tranhieutrung/Inception/blob/main/setup_docker.md)

3️⃣ Evaluation & Testing: [**Evaluation**](https://github.com/tranhieutrung/Inception/blob/main/evaluation.md)

