#!/bin/bash

echo "### Preparing Testing Environment ###";

if [ -d ~/projects/genny/gennyteer/ ]
then
    cd ~/projects/genny/gennyteer;
    git pull;
    ./build-docker.sh;
    echo "### Gennyteer exists ###";
else
    cd ~/projects/genny;
    git clone https://github.com/genny-project/gennyteer.git;
    cd ~/projects/genny/gennyteer;
    ./build-docker.sh;
fi