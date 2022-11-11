#!/usr/bin/env sh

# Setting all the environment variables
export $(grep -v '^#' .env | xargs)

EXISTS_CONTAINER=$(docker ps | grep "${CONTAINER_NAME:-container}")
# Initializating the container if it doesn't exist
if [ -z "$EXISTS_CONTAINER" ]; then
    docker-compose -f docker-compose-container.yml up -d;
fi

COMMAND_START='cat $CONTAINER_PATH/docker/console/set-console.sh > ~/.bashrc && bash';

# Executing the console in the container
docker exec -it ${CONTAINER_NAME:-container} bash -c "$COMMAND_START"