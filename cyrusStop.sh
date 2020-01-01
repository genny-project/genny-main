#!/bin/bash
ENV_FILE=genny.env docker-compose stop wildfly-rulesservice qwanda-service 
#ENV_FILE=genny.env docker-compose rm -f $@

