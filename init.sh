#!/bin/bash

# Setting all the environment variables
export $(grep -v '^#' .env | xargs)

EXISTS_CONTAINER=$(docker ps | grep "${CONTAINER_NAME:-container}")
# Initializating the container
if [ -z "$EXISTS_CONTAINER" ]; then
    docker-compose up -d;
fi

# Executing the console in the container
docker exec -it ${CONTAINER_NAME:-container} bash