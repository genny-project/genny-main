#!/bin/bash
#jdk 1.8
#find all the projects
rm -Rf ./rules/prj_*
#cp -rp ../prj_genny/rules/rulesCurrent ./rules/
#mkdir rules
for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   mkdir -p ./rules/$i
   cp -rp ../$i/rules ./rules/$i/
  echo $i
done

#Copy all the protobufs, and svgs
PERSISTENCE_FOLDER=./target/protobuf
KOGITO_TRAVEL_AGENCY_PERSISTENCE=../gennyq/kogitoq/extended/travels/target/classes/META-INF/resources/persistence/protobuf
KOGITO_VISAS_PERSISTENCE=../gennyq/kogitoq/extended/visas/target/classes/META-INF/resources/persistence/protobuf
KOGITO_GADAQ_PERSISTENCE=../gennyq/kogitoq/gadaq/target/classes/META-INF/resources/persistence/protobuf

mkdir -p $PERSISTENCE_FOLDER
rm -Rf $PERSISTENCE_FOLDER/*

if [ -d "$KOGITO_GADAQ_PERSISTENCE" ]
then
    cp $KOGITO_GADAQ_PERSISTENCE/*.proto $PERSISTENCE_FOLDER
else
    echo "$KOGITO_GADAQ_PERSISTENCE does not exist. Have you compiled your GADAQ project?"
    exit 1
fi

if [ -d "$KOGITO_TRAVEL_AGENCY_PERSISTENCE" ]
then
    cp $KOGITO_TRAVEL_AGENCY_PERSISTENCE/*.proto $PERSISTENCE_FOLDER
else
    echo "$KOGITO_TRAVEL_AGENCY_PERSISTENCE does not exist. Have you compiled your Kogito Travel Agency project?"
    exit 1
fi

if [ -d "$KOGITO_VISAS_PERSISTENCE" ]
then
    cp $KOGITO_VISAS_PERSISTENCE/*.proto $PERSISTENCE_FOLDER
else
    echo "$KOGITO_VISAS_PERSISTENCE does not exist. Have you compiled your Kogito Visas project?"
    exit 1
fi

SVG_FOLDER=./svg

KOGITO_TRAVEL_SVG_FOLDER=../gennyq/kogitoq/extended/travels/target/classes/META-INF/processSVG
KOGITO_VISAS_SVG_FOLDER=../gennyq/kogitoq/extended/visas/target/classes/META-INF/processSVG
KOGITO_GADAQ_SVG_FOLDER=../gennyq/kogitoq/gadaq/target/classes/META-INF/processSVG

mkdir -p $SVG_FOLDER

if [ -d "$KOGITO_TRAVEL_SVG_FOLDER" ]
then
    cp $KOGITO_TRAVEL_SVG_FOLDER/*.svg $SVG_FOLDER
else
    echo "$KOGITO_TRAVEL_SVG_FOLDER does not exist. Have you compiled Kogito Travel Agency project?"
    exit 1
fi

if [ -d "$KOGITO_GADAQ_SVG_FOLDER" ]
then
    cp $KOGITO_GADAQ_SVG_FOLDER/*.svg $SVG_FOLDER
else
    echo "$KOGITO_GADAQ_SVG_FOLDER does not exist. Have you compiled GADAQ project?"
    exit 1
fi

if [ -d "$KOGITO_VISAS_SVG_FOLDER" ]
then
    cp $KOGITO_VISAS_SVG_FOLDER/*.svg $SVG_FOLDER
else
    echo "$KOGITO_VISAS_SVG_FOLDER does not exist. Have you compiled Kogito Visas project?"
    exit 1
fi



customercode=${1}
mode=${2}
#create the ip controlled network
docker network create --gateway 172.18.0.1 --subnet 172.18.0.0/24 mainproxy




./run-setup.sh -p ${customercode} -r ${customercode} -n 10.123.123.123 ${mode} 
./say.sh "Genny System $1 Finished Loading"
