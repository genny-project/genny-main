#!/bin/bash
if hash kafkacat 2>/dev/null; then 
    kafkacat -b kafka:9092 -C -o beginning -q -t $1
else
    echo "kafkacat not installed"
    echo "Ubuntu: sudo apt-get install kafkacat"
    echo "Fedora: refer to this: https://rmoff.net/2020/04/20/how-to-install-kafkacat-on-fedora/"
fi
