#!/bin/bash
source $ENV_FILE
if [[ -n "$PRODUCT_CODES" ]] 
then
	if [ -d "../products" ];
	then
		products=($(echo $PRODUCT_CODES | tr ":" "\n"))
		files="-f docker-compose.yml"
		for p in "${products[@]}"
		do
			files="${files} -f ../products/prd_${p}/docker-compose.yml"
		done
		ENV_FILE=genny.env docker-compose ${files} stop $@
		#ENV_FILE=genny.env docker-compose ${files} rm -f $@
	else 
		ENV_FILE=genny.env docker-compose stop $@
		#ENV_FILE=genny.env docker-compose rm -f $@
	fi
else
	ENV_FILE=genny.env docker-compose stop $@
	# ENV_FILE=genny.env docker-compose rm -f $@
fi


