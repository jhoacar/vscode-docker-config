# VSCode Docker Container Configuration

## This setting can be used to bypass all the steps for a new environment and just run the necessary scripts in some languages.

## Instalation

* Copy the [.vscode/settings](.vscode/settings) in your project
* Copy the [docker/console](docker/console) folder in your workspace folder
* Copy the [init.sh](init.sh) and the [docker-compose-container.yml](docker-compose-container.yml)
* Create or copy the [.env](.env) file for custom configuration
* Install in your machine `fontawesome`, clicking all the `.otf` files
    * [FontAwesome](./fontawesome/otfs)

### Example for the `.env` file

```
DOCKER_IMAGE=rust
CONTAINER_NAME=my_rust
CONTAINER_PATH=/app
```

### When you click to add a new console in vscode you will see a new console called `container` with your settings


## Note: It is important to run an image that has a bash console