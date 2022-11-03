#!/bin/bash

# Setting all the environment variables
export $(grep -v '^#' .env | xargs)

# Initializating the container
docker-compose up -d;

# Executing the console in the container
docker exec -it ${CONTAINER_NAME:-container} bash