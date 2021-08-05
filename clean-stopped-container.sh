#!/bin/bash
docker container ls -a|grep Exited|xargs docker rm -v
