#!/bin/bash
ENV_FILE=genny.env docker-compose -f local.yml  stop $@
ENV_FILE=genny.env docker-compose -f local.yml  rm -f $@

