ARG DOCKER_IMAGE="ubuntu"
FROM $DOCKER_IMAGE

# Debug mode
RUN set -eux

# Install necessary dependecies
RUN apt update && apt install -y \
    git \
    sudo \
    fontconfig

ARG UID="1000"
ARG USERNAME="dev"
ARG CONTAINER_PATH="/app"

ENV UID=$UID
ENV USERNAME=$USERNAME
ENV CONTAINER_PATH=$CONTAINER_PATH

# We need a user with the same UID/GID as the host user
# so when we execute CLI commands, all the host file's permissions and ownership remain intact.
# Otherwise commands from inside the container would create root-owned files and directories.

# Create the user
RUN useradd -G root -u $UID -d /home/$USERNAME -s /bin/bash $USERNAME
# Enable run commands without sudo
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

# We will add fontawesome in the container
ENV LANG='en_US.UTF-8'
ADD docker/fonts /usr/local/share/fonts/
RUN fc-cache -v

USER $USERNAME

WORKDIR $CONTAINER_PATH

