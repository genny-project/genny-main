#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
    os_type="mac"
    say "$1"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    os_type="linux"
    if hash spd-say 2>/dev/null; then
         spd-say "$1"
    else
         echo "Linux: https://command-not-found.com/spd-say to install spd-say"
    fi
fi

