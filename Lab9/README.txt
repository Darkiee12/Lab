# Project Name

## Description

Briefly describe your project here.

## Prerequisites

Make sure you have the following installed:

- Docker
- Docker Compose

## Usage

1. Build and run the Docker containers:

   ```bash
   docker-compose up -d --build
   ```

   This command will build the Docker images if they don't exist and start the containers in detached mode.

2. Access the services:

   - Your backend service will be available at [http://localhost:3000](http://localhost:3000)
   - Including Swagger to test the API at [here](http://localhost:3000/docs/)
   - Your database service will be available at [mysql://localhost:3306](mysql://localhost:3306)
   - Your frontend service will be available at [http://localhost:5173](http://localhost:5173)

## Additional Notes

- If you encounter any issues or want to customize the configuration, refer to the `docker-compose.yml` file and the corresponding Dockerfiles.

- To stop the containers, run:

  ```bash
  docker-compose down
  ```
