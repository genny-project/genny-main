#!/bin/bash
echo "Genny Main"
git stash
git pull

echo "Updating genny-main"
git stash
git pull

parentdir="$(dirname `pwd`)"

ver=$1

for value in alyson bootq gennyq
do
    echo $value
    if [ ! -d "../"$value ]; then
        if [ ! -z $ver ]; then
            	echo "Cloning "$value" repo into ../"$value
            	git clone -b ${ver} git@github.com:genny-project/$value ../$value
            	if [ ! -d "../"$value ]; then
	    		git clone -b ${ver} git@github.com:OutcomeLife/$value ../$value
        	fi
	else
            echo "Could not find $value repository, and no version specified."
            echo "Please specify a version with: ./cyrusPull.sh <ver>"
            echo "E.g ./cyrusPull.sh 10.0.0"
        fi
    else
        echo "Found "$value" repo"
        cd $parentdir/${value}
        git stash
        git pull
    fi
done
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
                                                echo "Pulling prd_${p}"
                                                cd ${HOME}/projects/genny/products/prd_${p}
                                                git stash
						git pull 
                                        done
                                fi
                        else
                          echo "No Products available"
                        fi

