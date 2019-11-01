#!/bin/bash

ENV_FILE=genny.env

ENV_FILE=$ENV_FILE docker-compose logs -f $@ 
