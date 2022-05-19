#!/bin/bash
if [ "$#" -eq 0 ]; then
	echo "Usage: $0 <topic>"
	kafkacat -b localhost -L | grep topic
	exit 1
fi
if hash kafkacat 2>/dev/null; then 
    kafkacat -b alyson.genny.life:9092 -C -o beginning -q -t $1
else
    echo "kafkacat not installed"
    echo "Ubuntu: sudo apt-get install kafkacat"
    echo "Fedora: refer to this: https://rmoff.net/2020/04/20/how-to-install-kafkacat-on-fedora/"
fi
