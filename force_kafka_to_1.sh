#!/bin/bash

docker exec -i kafka bash -c " \
printf '%s\n%s\n' 'security.protocol=PLAINTEXT' 'sasl.mechanism=PLAIN' > prop && \
kafka-topics --bootstrap-server localhost:9092 --create --topic __consumer_offsets --partitions 1 --replication-factor 1 "
#kafka-topics --bootstrap-server localhost:9092 --create --topic __consumer_offsets --partitions 1 --replication_factor 1"
echo "Kafka force topic consumer_offsets = 1"
