#!/bin/bash
if [[ ! "$#" -eq 1 ]]; then
	echo "Usage: ./update-maven.sh 3.X.X"
	exit 1
fi

ver=$1

sudo rm -rf "/opt/apache-maven-$ver"
sudo rm /opt/maven

url="https://dlcdn.apache.org/maven/maven-3/$ver/binaries/apache-maven-$ver-bin.tar.gz"
wget $url
name="apache-maven-$ver"
zipped_name="$name-bin.tar.gz"

sudo rm -f "$zipped_name.1"

sudo mv ./$zipped_name /opt/
cd /opt
sudo tar xf $zipped_name
sudo rm -f $zipped_name
sudo ln -s $name "maven"
