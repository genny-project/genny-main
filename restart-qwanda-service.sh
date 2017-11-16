#!/bin/bash

ENV_FILE=genny.env
ENV_FILE=$ENV_FILE docker-compose stop  qwanda-service 
ENV_FILE=$ENV_FILE docker-compose up -d  
ENV_FILE=$ENV_FILE docker-compose logs -f  qwanda-service 
