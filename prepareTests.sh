#!/bin/bash

echo "### Preparing Testing Environment ###";

if [ -d ~/projects/genny/gennyteer/ ]
then
    cd ~/projects/genny/gennyteer;
    git pull;
    ./build-docker.sh;
else
    cd ~/projects/genny;
    git clone https://github.com/genny-project/gennyteer.git;
    cd ~/projects/genny/gennyteer;
    ./build-docker.sh;
fi

if [ -d ~/projects/genny/prj_internmatch/ ]
then
    cd ~/projects/genny/prj_internmatch;
    git pull;
    
else
    cd ~/projects/genny;
    git clone https://github.com/OutcomeLife/prj_internmatch.git;
    cd ~/projects/genny/prj_internmatch;

fi