#!/bin/bash
docker ps -a|grep Exited|awk '{print $1}'|xargs docker rm -v
for i in `docker images |grep latest|awk '{print $1}'`; do  docker rmi $i;done
