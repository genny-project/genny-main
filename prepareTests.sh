#!/bin/bash

pathDir=$1

echo "### Preparing Testing Environment ###";

if [ -d ~/projects/genny/gennyteer/ ]
then
    cd ~/projects/genny/gennyteer;
    git pull;
    # ./build-docker.sh;
else
    cd ~/projects/genny;
    git clone https://github.com/genny-project/gennyteer.git;
    cd ~/projects/genny/gennyteer;
    # ./build-docker.sh;
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

cd ~/projects/genny/prj_internmatch/tests/interaction/tests;
mkdir 00_${pathDir};
cd 00_${pathDir};
mkdir 00_${pathDir};

final_pathDir=~/projects/genny/prj_internmatch/tests/interaction/tests/00_${pathDir}/00_${pathDir}/${pathDir}.js;

if [ "x""${final_pathDir}" != "x" ]
then
    touch ${final_pathDir}
else
    echo "### Path Dir does not exist ###";
fi