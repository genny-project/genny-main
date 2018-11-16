#!/bin/bash

ENV_FILE=genny.env

ENV_FILE=$ENV_FILE docker-compose -f local.yml  logs -f $@ 
