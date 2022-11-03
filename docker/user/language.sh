npm_version(){
    # NPM_ICON=$'\xF0\x9F\x93\xA6'
    NPM_ICON=$'\xef\x8f\x94'; # 
    echo -n "$NPM_ICON  $(npm -v 2>/dev/null)"
}

node_version(){	
    # NODE_ICON=$'\xE2\x9A\x99'
    NODE_ICON=$'\xef\x8f\x93'; # 
    echo -n "$NODE_ICON  $(node -v 2>/dev/null)"
}

php_version(){
    PHP_ICON=$'\xef\x91\x97';#  
    echo -n "$PHP_ICON  $(php -r 'echo PHP_VERSION;' 2>/dev/null) "
}

composer_version(){
    COMPOSER_ICON=$'\xef\x83\x90'; # 
    echo -n "$COMPOSER_ICON  $(composer --version | awk '{print $3}' 2>/dev/null)"
}

golang_version(){
    GOLANG_ICON=$'\xee\x90\x8f'; # 
    echo -n "\[\e[36m\] $GOLANG_ICON. $(go version | awk '{print $3}' | grep -Eo '[0-9.]*' 2>/dev/null)"
}

echo -n $(golang_version)

