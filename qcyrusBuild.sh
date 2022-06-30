#!/bin/bash
parentdir="$(dirname `pwd`)"

ver=$1
cd ../gennyq
./build.sh;./build-docker.sh

cd $parentdir/genny-main

if [[ -n "$PRODUCT_CODES" ]]
                        then
                                if [ -d "../products" ];
                                then
                                        products=($(echo $PRODUCT_CODES | tr ":" "\n"))
                                        files="-f docker-compose.yml"
                                        for p in "${products[@]}"
                                        do
                                                echo "Building prd_${p}"
                                                cd ${HOME}/projects/genny/products/prd_${p}
                                                ./build.sh;./build-docker.sh 
						 
                                        done
                                fi
                        else
                          echo "No Products available"
                        fi

