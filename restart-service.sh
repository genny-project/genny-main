#!/bin/zsh
ENV_FILE=genny.env docker-compose stop   $@
ENV_FILE=genny.env docker-compose rm -f $@
ENV_FILE=genny.env docker-compose up -d $@
