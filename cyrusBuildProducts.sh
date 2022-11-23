#!/bin/bash
set -e
clean=$1
parentdir="$(dirname `pwd`)"

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
                                                #copy across SVG and protos
                                                cd ../products/prd_${p}
						./build.sh $clean;./build-docker.sh
                                        done
                                fi
                        else
                          echo "No Products available"
                        fi


cd $parentdir/genny-main
echo "Finished Building all Products"
./say.sh "Completed Building $clean all Products"
