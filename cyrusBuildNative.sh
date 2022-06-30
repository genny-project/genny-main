#!/bin/bash
set -e
clean=$1
parentdir="$(dirname `pwd`)"
echo "parent dir is $parentdir"
cd $parentdir/gennyq
./build.sh

for i in "lauchy" "dropkick" "fyodor" "bridge" "messages"  
do 
  echo "Build ${i}"
  cd "$parentdir/gennyq/${i}"
  #./mvnw package -Pnative  -Dquarkus.native.container-build=true  -Dquarkus.container-image.build=true -DskipTests=true
./build-docker-native.sh
done

for i in "gadaq"    
do 
  cd "$parentdir/gennyq/kogitoq/${i}"
 ./build-docker-native.sh
done


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
                                                cd $parentdir/products/prd_${p}
						./build-docker-native.sh
                                        done
                                fi
                        else
                          echo "No Products available"
                        fi


cd $parentdir/genny-main
echo "Finished Building all native Products"
./say.sh "Completed Building all Native Products"

