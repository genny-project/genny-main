#!/bin/bash

ENV_FILE=.env

ENV_FILE=$ENV_FILE docker-compose -f docker-compose.robot-isolated.yml up -d &&  \
ENV_FILE=$ENV_FILE docker-compose -f docker-compose.robot-isolated.yml logs -f
