#!/bin/bash

parentdir="$(dirname `pwd`)"
VER=$1

for value in $parentdir/*
do
    echo $value
    cd $value
    git stash
    git fetch
    git checkout $VER
done

for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   echo $i
   cd $parentdir/$i
#   git stash
#   git checkout $VER
done
