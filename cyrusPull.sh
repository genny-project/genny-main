#!/bin/bash
echo "Genny Main"
git stash
git pull

echo "Updating genny-main"
git stash
git pull

parentdir="$(dirname `pwd`)"

ver=$1

for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules  media-proxy notes shleemy alyson bootq gennyq api2email
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

for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   echo $i
   cd $parentdir/$i
   git stash;git pull
done
