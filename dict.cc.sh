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
    local url="http://"$lang"pocket.dict.cc/?s="$sanitized""

    local text=$(lynx -display_charset=UTF-8 -dump "$url" | tail -n +6 )

    # Tail reverse because of mac os
    text=$(echo "${text%©*}" | tail -r | tail -n +4 | tail -r)

    local nLines=$(echo "$text" | wc -l ) 
    
    if [ "$nLines" -lt "$LESS_CONDITION" ]
    then
        echo "$text"
    else
        echo "$text" | less
    fi
}
