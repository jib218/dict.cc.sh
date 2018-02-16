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

    local text=$(lynx -display_charset=UTF-8 -dump "$url" | tail -n +8 | \
                  LC_ALL=C sed 's/\[\([[:digit:]]*\)\]//' )

    if [[ "$(uname)" == "Linux" ]] # linux has no tail -r
    then
        text=$(echo "${text%©*}" | head -n -4 )
    else # mac os has no head -n -4
        text=$(echo "${text%©*}" | tail -r | tail -n +4 | tail -r )
    fi

    local nLines=$(echo "$text" | wc -l ) 
    
    if [ "$nLines" -lt "$LESS_CONDITION" ]
    then
        echo "$text"
    else
        echo "$text" | less
    fi
}
