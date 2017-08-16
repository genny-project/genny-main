#!/bin/bash

ENV_FILE=genny.env
ENV_FILE=$ENV_FILE docker-compose stop $@ 
ENV_FILE=$ENV_FILE docker-compose rm -f $@ 
ENV_FILE=$ENV_FILE docker-compose up -d $@ 
ENV_FILE=$ENV_FILE docker-compose logs -f $@ 
