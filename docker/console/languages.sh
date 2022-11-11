#!/bin/bash

GREEN=$'\e[32m';
YELLOW=$'\e[33m';
RESET=$'\e[00m';
CYAN=$'\e[36m';
RED=$'\e[91m';
PURPLE=$'\e[35m';
GRAY=$'\e[37m';

npm_version(){
    NPM_ICON=$'\xef\x8f\x94'; # 
    NPM_VERSION=$(npm -v 2>/dev/null);
    if [ ! -z "$NPM_VERSION" ]; then
        echo -n "$YELLOW$NPM_ICON. $NPM_VERSION $RESET";
    fi
}

node_version(){	
    NODE_ICON=$'\xef\x8f\x93'; # 
    NODE_VERSION=$(node -v 2>/dev/null | grep -oE '[0-9.]*');
    if [ ! -z "$NODE_VERSION" ]; then
        echo -n "$GREEN$NODE_ICON. $NODE_VERSION $RESET";
    fi
}

php_version(){
    PHP_ICON=$'\xef\x91\x97';#  
    PHP_VERSION=$(php -r 'echo PHP_VERSION;' 2>/dev/null);
    if [ ! -z "$PHP_VERSION" ]; then
        echo -n "$PURPLE$PHP_ICON. $PHP_VERSION $RESET";
    fi
}

composer_version(){
    COMPOSER_ICON=$'\xef\x83\x90'; # 
    COMPOSER_VERSION=$(composer --version 2>/dev/null | awk '{print $2}');
    if [ ! -z "$COMPOSER_VERSION" ]; then
        echo -n "$GRAY$COMPOSER_ICON. $COMPOSER_VERSION $RESET";
    fi
}

laravel_version(){
    LARAVEL_ICON=$'\xef\x8e\xbd'; # 
    LARAVEL_VERSION=$([ -f $CONTAINER_PATH/artisan ] && php $CONTAINER_PATH/artisan --version 2>/dev/null | awk '{print $3}')
    if [ ! -z "$LARAVEL_VERSION" ]; then
        echo -n "$RED$LARAVEL_ICON. $LARAVEL_VERSION $RESET";
    fi
}

python_version(){
    PYTHON_ICON=$'\xef\x8f\xa2' # 
    PYTHON_VERSION=$(python --version 2>&1 | grep -oE '[0-9.]+')
    if [ ! -z "$PYTHON_VERSION" ]; then
        echo -n "$PURPLE$PYTHON_ICON. $PYTHON_VERSION $RESET";
    fi 
}

golang_version(){
    GOLANG_ICON=$'\xee\x90\x8f'; # 
    GOLANG_VERSION=$(go version 2>/dev/null | grep -oE 'go[0-9.]*' | grep -oE '[0-9.]*');
    if [ ! -z "$GOLANG_VERSION" ]; then
        echo -n "$CYAN$GOLANG_ICON. $GOLANG_VERSION $RESET";
    fi
}

rust_version(){
    RUST_ICON=$'\xee\x81\xba'; # 
    RUST_VERSION=$(rustc --version 2>/dev/null | awk '{print $2}')
    if [ ! -z "$RUST_VERSION" ]; then
        echo -n "$RED$RUST_ICON. $RUST_VERSION $RESET";
    fi
}

java_version(){
    JAVA_ICON=$'\xef\x93\xa4'; # 
    JAVA_VERSION=$(java --version 2>/dev/null | head -1 | awk '{print $2}')
    if [ ! -z "$JAVA_VERSION" ]; then
        echo -n "$YELLOW$JAVA_ICON. $JAVA_VERSION $RESET";
    fi
}

npm_version
node_version
php_version
composer_version
laravel_version
python_version
rust_version
golang_version
java_version