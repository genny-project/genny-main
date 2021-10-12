#!/bin/bash
docker run --tty --rm -i --network mainproxy debezium/tooling:1.1
#kafkacat -b kafka:9092 -C -o beginning -q -t temperatures-aggregated
