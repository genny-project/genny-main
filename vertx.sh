#!/bin/bash

ENV_FILE=genny.env
./create_genny_env.sh ${ENV_FILE}

ENV_FILE=$ENV_FILE docker-compose -f vertx.yml  up -d
ENV_FILE=$ENV_FILE docker-compose -f vertx.yml logs -f bridge
