#!/bin/bash
service=$1
scale=$2
ENV_FILE=genny.env docker-compose scale ${service}=${scale} 

