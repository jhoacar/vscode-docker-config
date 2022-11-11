[ -z "$PS1" ] && return

parse_git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

GREEN="\[\e[32m\]";
YELLOW="\[\e[33m\]";
RESET="\[\e[00m\]";
CYAN="\[\e[36m\]";
RED="\[\e[91m\]";

PS1="$GREEN\u@\h $YELLOW\w$RESET ";
PS1+="\$($CONTAINER_PATH/docker/console/languages.sh)$RESET ";
PS1+="$CYAN\$(parse_git_branch)$RESET ";
PS1+="\n$RED~$RESET ";

