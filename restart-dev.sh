#!/bin/bash

ENV_FILE=genny.env
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-dev.yml stop $@ 
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-dev.yml rm -f $@ 
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-dev.yml up -d $@ 
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-dev.yml logs -f $@ 
