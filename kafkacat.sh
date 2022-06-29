#!/bin/bash
if [ "$#" -eq 0 ]; then
	echo "Usage: $0 <topic>"
	kcat -b localhost -L | grep topic
	exit 1
fi


os_type=""
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    os_type="ubuntu"
if hash kafkacat 2>/dev/null; then 
    kakfacat -b alyson.genny.life:9092 -C -o beginning -q -t $1
else
    echo "kafkacat not installed"
    echo "Ubuntu: sudo apt-get install kafkacat"
    echo "Fedora: refer to this: https://rmoff.net/2020/04/20/how-to-install-kafkacat-on-fedora/"
fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    os_type="mac"
if hash kcat 2>/dev/null; then 
    kcat -b alyson.genny.life:9092 -C -o beginning -q -t $1
else
    echo "kcat not installed"
    echo "Ubuntu: sudo apt-get install kafkacat"
    echo "Fedora: refer to this: https://rmoff.net/2020/04/20/how-to-install-kafkacat-on-fedora/"
fi
fi

echo "OS Type is ${os_type}"


