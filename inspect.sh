#!/bin/zsh
if [ ! "$#" -eq 1 ]; then
    echo "Usage: $0 <container name>"
    echo "Requires jq to be installed"
    exit 1
fi
docker inspect --format "{{json .State.Health }}" $1 | jq
