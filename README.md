# TP04 - Containerization and Big Data Environment

## Project Description
This project demonstrates Docker image creation, container execution, Docker Hub publishing, container networking, and Docker Compose.

## Requirements
- Docker
- Docker Compose
- Python 3.12 image
- Dataset: data/train.csv

## Project Structure
- Dockerfile: Defines the Docker image.
- compose.yaml: Defines the Docker Compose service.
- data/: Contains the dataset.
- screenshots/: Contains practical work screenshots.
- REPORT.md: Practical work report.

## Build the Image
`docker build -t tp04-analysis:v1 .`

## Run the Container
`docker run --name tp04-container tp04-analysis:v1`

## Docker Hub
Repository: https://hub.docker.com/r/ghaya01/tp04-analysis

Pull the image:
`docker pull ghaya01/tp04-analysis:v1`

## Docker Network
Three containers were connected to the tp04-network bridge network. Host ports 8081, 8082, and 8083 were mapped to container port 80. DNS resolution and TCP communication were tested.

## Docker Compose
Start: `docker compose up --build`

Check: `docker compose ps -a`

Stop: `docker compose down`

## Screenshots
The screenshots folder contains evidence of the Docker image build, Docker Hub repository, containers and network, container communication, and Docker Compose execution.
