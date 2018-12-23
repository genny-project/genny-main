#!/bin/bash

ENV_FILE=genny.env
ENV_FILE=$ENV_FILE docker-compose -f local.yml  stop $@ 
ENV_FILE=$ENV_FILE docker-compose -f local.yml rm -f $@ 
ENV_FILE=$ENV_FILE docker-compose -f local.yml up -d $@ 
ENV_FILE=$ENV_FILE docker-compose -f local.yml logs -f $@ 
