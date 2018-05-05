#!/bin/bash
service=$1
scale=$2
ENV_FILE=genny.env docker-compose -f docker-compose-dev.yml  scale ${service}=${scale} 

