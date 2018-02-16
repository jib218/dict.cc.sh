#!/bin/bash

LESS_CONDITION=25
 
function dict {
    local lang=""
    local input=""

    if [[ "$1" == -* ]]
    then
        lang="${1#?}."
        input="${@:2}"
    else
        input="$@"
    fi

    local sanitized=$(echo "$input" | tr ' ' '+')
    local text=$(lynx -dump http://"$lang"pocket.dict.cc/?s="$sanitized" | \
                  sed '/sec/q' | tail -n +6 )
    
    local nLines=$(echo "$text" | wc -l ) 
    
    if [ "$nLines" -lt "$LESS_CONDITION" ]
    then
        echo "$text"
    else
        echo "$text" | less
    fi
}
