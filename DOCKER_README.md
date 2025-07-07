# Docker Setup for SevenTwentyClocks

This document explains how to run the SevenTwentyClocks application using Docker.

## Prerequisites

- Docker installed on your system
- Docker Compose installed on your system

## Running the Application

### Option 1: Using Docker Compose (Recommended)

1. Navigate to the project directory:
   ```
   cd /path/to/seventwentyclocks
   ```

2. Build and start the container:
   ```
   docker-compose up -d
   ```

3. Access the application at http://localhost:4000

4. To stop the container:
   ```
   docker-compose down
   ```

### Option 2: Using Docker Directly

1. Build the Docker image:
   ```
   docker build -t seventwentyclocks .
   ```

2. Run the container:
   ```
   docker run -p 4000:4000 --name seventwentyclocks seventwentyclocks
   ```

3. Access the application at http://localhost:4000

4. To stop the container:
   ```
   docker stop seventwentyclocks
   docker rm seventwentyclocks
   ```

## Development Mode

If you want to run the application in development mode with hot reloading:

1. Modify the Dockerfile to use the development command:
   ```
   CMD ["yarn", "start"]
   ```

2. Update the docker-compose.yml to mount your source code:
   ```yaml
   volumes:
     - ./src:/app/src
   ```

3. Rebuild and run:
   ```
   docker-compose up --build
   ```

## Troubleshooting

- If you encounter permission issues, try running Docker commands with sudo
- If the container exits immediately, check the logs with `docker logs seventwentyclocks`
- For networking issues, ensure port 4000 is not being used by another application
