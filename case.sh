#!/bin/bash

option="${1}" 

while [ "$1" != "" ]; do
   case $1 in 
      -f) FILE="${2}" 
         echo "File name is $FILE"
         shift
         ;; 
      -d) DIR="${2}" 
         echo "Dir name is $DIR"
         shift
         ;; 
       *)  
         echo "`basename ${0}`:usage: [-f file] | [-d directory]" 
         exit 1 # Command to come out of the program with status 1
         ;; 
   esac 
   shift
done
