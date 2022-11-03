ARG DOCKER_IMAGE="ubuntu"
FROM $DOCKER_IMAGE

# Debug mode
RUN set -eux

# Install necessary dependecies
RUN apt update && apt install -y \
    git \
    sudo

ARG UID="1000"
ARG USER="dev"
ARG CONTAINER_PATH="/app"

ENV UID=$UID
ENV USER=$USER
ENV CONTAINER_PATH=$CONTAINER_PATH

# We need a user with the same UID/GID as the host user
# so when we execute CLI commands, all the host file's permissions and ownership remain intact.
# Otherwise commands from inside the container would create root-owned files and directories.

# Create the user
RUN useradd -G root -u $UID -d /home/$USER -s /bin/bash $USER
# Enable run commands without sudo
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

USER $USER

WORKDIR $CONTAINER_PATH

