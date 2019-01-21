#!/bin/bash

ENV_FILE=genny.env
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-min.yml  stop $@ 
ENV_FILE=$ENV_FILE docker-compose  -f docker-compose-min.yml rm -f $@ 
ENV_FILE=$ENV_FILE docker-compose  -f docker-compose-min.yml up -d $@ 
ENV_FILE=$ENV_FILE docker-compose  -f docker-compose-min.yml logs -f $@ 
