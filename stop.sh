#!/bin/bash
ENV_FILE=genny.env docker-compose stop $1
ENV_FILE=genny.env docker-compose rm -f $1

