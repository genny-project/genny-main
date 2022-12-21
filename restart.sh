#!/bin/bash
#find all the projects
rm -Rf ./rules/prj_*
#cp -rp ../prj_genny/rules/rulesCurrent ./rules/
mkdir rules
for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   mkdir ./rules/$i
   cp -rp ../$i/rules ./rules/$i/
  echo $i
done

#Copy all the protobufs, and svgs
PERSISTENCE_FOLDER=./target/protobuf
KOGITO_GADAQ_PERSISTENCE=../gennyq/kogitoq/gadaq/target/classes/META-INF/resources/persistence/protobuf

rm -Rf $PERSISTENCE_FOLDER/*
mkdir -p $PERSISTENCE_FOLDER

if [ -d "$KOGITO_GADAQ_PERSISTENCE" ]
then
    cp $KOGITO_GADAQ_PERSISTENCE/*.proto $PERSISTENCE_FOLDER
else
    echo "$KOGITO_GADAQ_PERSISTENCE does not exist. Have you compiled your GADAQ project?"
    exit 1
fi

SVG_FOLDER=./svg

KOGITO_GADAQ_SVG_FOLDER=../gennyq/kogitoq/gadaq/target/classes/META-INF/processSVG

mkdir -p $SVG_FOLDER

if [ -d "$KOGITO_GADAQ_SVG_FOLDER" ]
then
    cp $KOGITO_GADAQ_SVG_FOLDER/*.svg $SVG_FOLDER
else
    echo "$KOGITO_GADAQ_SVG_FOLDER does not exist. Have you compiled GADAQ project?"
    # exit 1
fi

ENV_FILE=genny.env
                       source $ENV_FILE
                        if [[ -n "$PRODUCT_CODES" ]]
                        then
                                if [ -d "../products" ];
                                then
                                        products=($(echo $PRODUCT_CODES | tr ":" "\n"))
                                        files="-f docker-compose.yml"
                                        for p in "${products[@]}"
                                        do
                                                #copy across SVG and protos
                                                PERSISTENCE_FOLDER=target/protobuf
                                                SVG_FOLDER=svg
                                                PRODUCT_PERSISTENCE=../products/prd_${p}/target/classes/META-INF/resources/persistence/protobuf
                                                PRODUCT_SVG_FOLDER=../products/prd_${p}/target/classes/META-INF/processSVG
                                                files="${files} -f ../products/prd_${p}/docker-compose.yml"
                                                if [ -d "$PRODUCT_SVG_FOLDER" ]
                                                then
                                                   cp $PRODUCT_SVG_FOLDER/*.svg $SVG_FOLDER
                                                else
                                                   echo "$PRODUCT_SVG_FOLDER does not exist. Have you saved svgs for ${p} project?"
                                                # exit 1
                                                fi
                                                if [ -d "$PRODUCT_PERSISTENCE" ]
                                                then
                                                   cp $PRODUCT_PERSISTENCE/* $PERSISTENCE_FOLDER
                                                else
                                                   echo "$PRODUCT_PERSISTENCE does not exist. Have you compiled ${p} project?"
                                                # exit 1
                                                fi
                                        done
                                        echo "The docker-compose product files are ${files}"
                                        ENV_FILE=$ENV_FILE docker-compose ${files} stop $@
                                        ENV_FILE=$ENV_FILE docker-compose ${files} rm -f $@
                                        ENV_FILE=$ENV_FILE docker-compose ${files} up -d $@
                                else
                                ENV_FILE=$ENV_FILE docker-compose  stop $@
                                ENV_FILE=$ENV_FILE docker-compose   rm -f $@
                                ENV_FILE=$ENV_FILE docker-compose  up -d $@
                                fi
                        else
                                ENV_FILE=$ENV_FILE docker-compose  stop  $@
                                ENV_FILE=$ENV_FILE docker-compose   rm -f $@ 
                                ENV_FILE=$ENV_FILE docker-compose  up -d $@
                        fi
