# TP04 Report: Containerization and Big Data Environment

## 1. Introduction
The objective of this practical work is to learn containerization using Docker. The work includes building a Docker image, running containers, publishing and pulling an image from Docker Hub, creating a Docker network, testing communication between containers, and using Docker Compose.

## 2. What Is Docker?
Docker is a platform used to package and run applications in containers. It helps create consistent and reproducible environments and makes applications easier to deploy across different systems.

## 3. Docker Image vs. Docker Container
A Docker image is a template containing the application and its required environment. A Docker container is a running or stopped instance created from an image.

## 4. Dockerfile Instructions
The Dockerfile used in this practical work contains the following instructions:

- FROM python:3.12-slim: selects the base image.
- WORKDIR /app: sets /app as the working directory.
- COPY data /app/data: copies the local dataset directory into the image.
- RUN: executes a command during image construction to display the files in the data directory.
- CMD: defines the command executed when a container starts. In this project, it displays a success message and lists the available data files.

## 5. Building and Running the Image
The image was built using:

    docker build -t tp04-analysis:v1 .

The container was run using:

    docker run --name tp04-container tp04-analysis:v1

The output confirmed that the container started successfully and detected the train.csv dataset file.

## 6. Docker Hub
The image was tagged and published to Docker Hub.

Repository: https://hub.docker.com/r/ghaya01/tp04-analysis

The image was also pulled from Docker Hub and executed to verify that it was available remotely.

## 7. Docker Networking
A bridge network named tp04-network was created. Three containers were launched on this network with host ports 8081, 8082, and 8083 mapped to container port 80.

DNS resolution between containers was tested. A TCP connection was also tested, and the message "Connection successful" was received.

Note: the port mappings demonstrate port publishing; the container image does not run a web server on port 80.

## 8. Docker Compose
The Compose configuration defines a data-analysis service, builds the image from the current directory, mounts the local data directory at /app/data in read-only mode, and sets restart to "no".

The following commands were used:

    docker compose up --build
    docker compose ps -a
    docker compose down

The application printed its success message and listed train.csv. The container exited with code 0 because the configured command finishes after displaying the output. This indicates successful execution.

## 9. Questions and Answers

### 9.1 What problem does Docker Compose solve?
Docker Compose simplifies the definition and management of applications made up of one or more services using a YAML configuration file. It allows the services to be built, started, inspected, and stopped using a small set of commands.

### 9.2 What is the difference between docker run and docker compose up?
docker run starts an individual container using a specified image and command-line options. docker compose up reads the Compose configuration and manages the services defined in that file.

### 9.3 How can Docker Compose be extended to include a database?
A database service, such as MySQL or PostgreSQL, can be added to the Compose file. The configuration can specify the database image, environment variables, a persistent volume, and networking. The application can connect to the database using the database service name and the appropriate credentials.

## 10. Conclusion
This practical work demonstrated the main Docker operations: image building, container execution, Docker Hub publishing and pulling, container networking, communication testing, and Docker Compose. These techniques help create reproducible environments for data-related applications.
