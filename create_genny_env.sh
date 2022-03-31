#!/bin/bash

ENV_FILE=$1

# Check env file is specified
if [ -z $ENV_FILE ]; then
    echo "ENV_FILE NOT SPECIFIED"
    echo "Usage: ./create_genny_env.sh <ENV_FILE>"
    exit 1
fi

ENV_FILE_APP=${ENV_FILE}.json


if [ -z "${2}" ];then
echo "No ip supplied, determining local host ip ...."
myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi

else
echo "ip supplied... $2"
myip=$2

fi
echo $myip
CLUSTER_IP=127.0.0.1

#myip=127.0.0.2
docker volume create cassandra_data
docker volume create mysql_data

#create env file
KOGITO_VERSION=1.19.0
PERSISTENCE_FOLDER=./persistence/protobuf
KOGITO_TRAVEL_AGENCY_PERSISTENCE=../kogitoq2/kogitoq/extended/travels/target/classes/META-INF/resources/persistence/protobuf
KOGITO_VISAS_PERSISTENCE=../kogitoq2/kogitoq/extended/visas/target/classes/META-INF/resources/persistence/protobuf

mkdir -p $PERSISTENCE_FOLDER

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

KOGITO_TRAVEL_SVG_FOLDER=./processSVG
KOGITO_VISAS_SVG_FOLDER=./processSVG

#IS_CACHE_SERVER=true
CACHE_SERVER_NAME=infinispan
INFINISPAN_USERNAME=genny
INFINISPAN_PASSWORD=password

PDF_GEN_SERVICE_API_URL=http://camelot-pdfgenerator:7331
ENV_SECURITY_KEY=WubbaLubbaDubDub
ENV_SERVICE_PASSWORD=vRO+tCumKcZ9XbPWDcAXpU7tcSltpNpktHcgzRkxj8o=

REACT_APP_PROJECT_NAME="Docker Genny"
REACT_APP_QWANDA_API_URL=http://alyson7.genny.life
REACT_APP_VERSION_NUMBER=0.5
REACT_APP_BUILD_DATE=2017-07-12
REACT_BRIDGE_HOST=http://bridge.genny.life
#REACT_BRIDGE_HOST=http://${myip}:8088
REACT_UPPY_HOST=http://uppy.genny.life
REACT_APP_VERTX_URL=${REACT_BRIDGE_HOST}/frontend
REACT_APP_VERTX_SERVICE_API=${REACT_BRIDGE_HOST}/api/service
REACT_APP_VERTX_EVENTS_API=${REACT_BRIDGE_HOST}/api/events
REACT_APP_VERTX_CMDS_API=${REACT_BRIDGE_HOST}/api/cmds
REACT_APP_VERTX_DATA_API=${REACT_BRIDGE_HOST}/api/data

#DDT_URL=http://bridge.genny.life:8089

PAYMENT_SERVICE_API_URL=http://payments.genny.life
#PAYMENT_PROVIDER=assembly

UPPYSERVER_DOMAIN=uppy.genny.life
UPPYSERVER_SECRET="6X9zUJY825bn"
UPPYSERVER_DATADIR="app/uppy"

KEYCLOAK_PORT=8180
KEYCLOAK_PROTO="http://"
KEYCLOAK_USERNAME=admin
KEYCLOAK_PASSWORD=admin
CORS_ALLOWED_ORIGINS="http://localhost:3000,http://localhost:5000,http://alyson.genny.life,http://alyson3.genny.life,http://api.genny.life,http://qwanda-service.genny.life,http://qwanda-service,http://keycloak.genny.life"

FACEBOOK_CALLBACK_URL=http://social.genny.life
FACEBOOK_CLIENTID=423902461306952
FACEBOOK_SECRET=a7bd50640f9914b95756ae8f5680751b
SOCIAL_CALLBACK_URL=http://social.genny.life/

MYSQL_PORT=3306
MYSQL_DB=gennydb
MYSQL_URL=mysql
MYSQL_PASSWORD=password
FULL_MYSQL_URL="jdbc:mysql://${MYSQL_URL}:${MYSQL_PORT}/${MYSQL_DB}?allowPublicKeyRetrieval=true&syscharacterEncoding=utf8mb4&useSSL=FALSE&serverTimezone=UTC&rewriteBatchedStatements=true"
#FULL_MYSQL_URL=jdbc:mysql://${MYSQL_URL}:${MYSQL_PORT}/${MYSQL_DB}?allowPublicKeyRetrieval=true&syscharacterEncoding=utf8mb4&useSSL=FALSE&serverTimezone=UTC&rewriteBatchedStatements=true
MYSQL_USER=genny

#MYSQL_PASSWORD=password
MYSQL_ROOT_PASSWORD=password

MYSQL_ROOT_HOST=${HOSTIP}

LAYOUT_CACHE_HOST="http://layout-cache.genny.life"
KIE_SERVER_URL="http://${myip}:8230/kie-server/services/rest/server"
KIE_USERNAME="kieserver"
KIE_PASSWORD="kieserver1!"

DDT_URL=http://alyson7.geenny.life
DEVUSER=${USER}
RULES_DIR=/opt/rules

# Twilio test account credentials


# Email credentials

EMAIL_USERNAME=genny.life.user@gmail.com

# Mail Transfer Protocol variables

MAIL_SMTP_AUTH=true
MAIL_SMTP_STARTTLS_ENABLE=true
MAIL_SMTP_HOST=smtp.gmail.com
MAIL_SMTP_PORT=587
MEDIA_PROXY_SERVER_PORT=9898
MEDIA_PROXY_URL=http://127.0.0.1:$MEDIA_PROXY_SERVER_PORT/public

JAVA_OPTS="-Xms256m -Xmx512m -Djava.net.preferIPv4Stack=true"

# Find the host's local lan ip
echo "HOSTIP=${myip}" > $ENV_FILE
echo "DEVUSER=${DEVUSER}" >> $ENV_FILE
echo "" >> $ENV_FILE
echo "KOGITO_VERSION=${KOGITO_VERSION}" >> $ENV_FILE
echo "PERSISTENCE_FOLDER=${PERSISTENCE_FOLDER}" >> $ENV_FILE
echo "KOGITO_TRAVEL_AGENCY_PERSISTENCE=${KOGITO_TRAVEL_AGENCY_PERSISTENCE}" >> $ENV_FILE
echo "KOGITO_VISAS_PERSISTENCE=${KOGITO_VISAS_PERSISTENCE}" >> $ENV_FILE
echo "SVG_FOLDER=${SVG_FOLDER}" >> $ENV_FILE
echo "KOGITO_TRAVEL_SVG_FOLDER=${KOGITO_TRAVEL_SVG_FOLDER}" >> $ENV_FILE
echo "KOGITO_VISAS_SVG_FOLDER=${KOGITO_VISAS_SVG_FOLDER}" >> $ENV_FILE
echo "" >> $ENV_FILE
#echo "GOOGLE_HOSTING_SHEET_ID=${GOOGLE_HOSTING_SHEET_ID}" >> $ENV_FILE
#echo "GOOGLE_CLIENT_SECRET=${GOOGLE_CLIENT_SECRET}" >> $ENV_FILE
echo "REACT_APP_PROJECT_NAME=${REACT_APP_PROJECT_NAME}" >> $ENV_FILE
echo "ENV_SECURITY_KEY=${ENV_SECURITY_KEY}" >> $ENV_FILE
echo "ENV_SERVICE_PASSWORD=${ENV_SERVICE_PASSWORD}" >> $ENV_FILE
echo "REACT_APP_QWANDA_API_URL=${REACT_APP_QWANDA_API_URL}" >> $ENV_FILE
echo "REACT_APP_VERSION_NUMBER=${REACT_APP_VERSION_NUMBER}" >> $ENV_FILE
echo "REACT_APP_BUILD_DATE=${REACT_APP_BUILD_DATE}" >> $ENV_FILE
echo "REACT_BRIDGE_HOST=${REACT_BRIDGE_HOST}" >> $ENV_FILE
echo "REACT_UPPY_HOST=${REACT_UPPY_HOST}" >> $ENV_FILE
echo "REACT_APP_VERTX_URL=${REACT_APP_VERTX_URL}" >> $ENV_FILE
echo "REACT_APP_VERTX_SERVICE_API=${REACT_APP_VERTX_SERVICE_API}" >> $ENV_FILE
echo "REACT_APP_VERTX_EVENTS_API=${REACT_APP_VERTX_EVENTS_API}" >> $ENV_FILE
echo "REACT_APP_VERTX_CMDS_API=${REACT_APP_VERTX_CMDS_API}" >> $ENV_FILE
echo "REACT_APP_VERTX_DATA_API=${REACT_APP_VERTX_DATA_API}" >> $ENV_FILE
echo "MEDIA_PROXY_SERVER_PORT=${MEDIA_PROXY_SERVER_PORT}" >> $ENV_FILE
echo "MEDIA_PROXY_URL=${MEDIA_PROXY_URL}" >> $ENV_FILE

#echo "DDT_URL=${DDT_URL}" >> $ENV_FILE

echo "LAYOUT_CACHE_HOST=${LAYOUT_CACHE_HOST}" >> $ENV_FILE

echo "PDF_GEN_SERVICE_API_URL=${PDF_GEN_SERVICE_API_URL}" >> $ENV_FILE

echo "UPPYSERVER_DOMAIN=${UPPYSERVER_DOMAIN}" >> $ENV_FILE
echo "UPPYSERVER_SECRET=${UPPYSERVER_SECRET}" >> $ENV_FILE
echo "UPPYSERVER_DATADIR=${UPPYSERVER_DATADIR}" >> $ENV_FILE

# Credentials for message
echo "EMAIL_USERNAME=${EMAIL_USERNAME}" >> $ENV_FILE
echo "EMAIL_PASSWORD=${EMAIL_PASSWORD}" >> $ENV_FILE
echo "MAIL_SMTP_AUTH=${MAIL_SMTP_AUTH}" >> $ENV_FILE
echo "MAIL_SMTP_STARTTLS_ENABLE=${MAIL_SMTP_STARTTLS_ENABLE}" >> $ENV_FILE
echo "MAIL_SMTP_HOST=${MAIL_SMTP_HOST}" >> $ENV_FILE
echo "MAIL_SMTP_PORT=${MAIL_SMTP_PORT}" >> $ENV_FILE

echo "" >> $ENV_FILE
echo "KEYCLOAKPORT=${KEYCLOAK_PORT}" >> $ENV_FILE
echo "KEYCLOAKPROTO=${KEYCLOAK_PROTO}" >> $ENV_FILE
echo "KEYCLOAKURL=https://bouncer.outcome-hub.com" >> $ENV_FILE
#echo "KEYCLOAKURL=${KEYCLOAK_PROTO}${myip}:${KEYCLOAK_PORT}" >> $ENV_FILE
echo "KEYCLOAK_USERNAME=${KEYCLOAK_USERNAME}" >> $ENV_FILE
echo "KEYCLOAK_SERVICE_ID=${KEYCLOAK_SERVICE_ID}" >> $ENV_FILE
echo "KEYCLOAK_PASSWORD=${KEYCLOAK_PASSWORD}" >> $ENV_FILE
echo "KEYCLOAK_SECRET=${KEYCLOAK_SECRET}" >> $ENV_FILE
echo "CORS_ALLOWED_ORIGINS=${CORS_ALLOWED_ORIGINS}" >> $ENV_FILE
echo "" >> $ENV_FILE
echo "MYSQL_URL=${MYSQL_URL}" >> $ENV_FILE
echo "MYSQL_DB=${MYSQL_DB}" >> $ENV_FILE
echo "MYSQL_DATABASE=${MYSQL_DB}" >> $ENV_FILE
echo "MYSQL_PORT=${MYSQL_PORT}" >> $ENV_FILE
echo "MYSQL_USER=${MYSQL_USER}" >> $ENV_FILE
echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}" >> $ENV_FILE
echo "MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" >> $ENV_FILE
echo "MYSQL_ALLOW_EMPTY=${MYSQL_ALLOW_EMPTY}" >> $ENV_FILE
echo "RULES_DIR=${RULES_DIR}" >> $ENV_FILE

echo "KIE_SERVER=${KIE_SERVER_URL}" >> $ENV_FILE
echo "KIE_USERNAME=${KIE_USERNAME}" >> $ENV_FILE
echo "KIE_PASSWORD=${KIE_PASSWORD}" >> $ENV_FILE

echo "FACEBOOK_CALLBACK_URL=${FACEBOOK_CALLBACK_URL}" >> $ENV_FILE
echo "FACEBOOK_CLIENTID=${FACEBOOK_CLIENTID}" >> $ENV_FILE
echo "FACEBOOK_SECRET=${FACEBOOK_SECRET}" >> $ENV_FILE
echo "SOCIAL_CALLBACK_URL=${SOCIAL_CALLBACK_URL}" >> $ENV_FILE
echo "JAVA_OPTS=${JAVA_OPTS}" >> $ENV_FILE

echo "CLUSTER_IP=${CLUSTER_IP}" >> $ENV_FILE
echo "IS_CACHE_SERVER=${IS_CACHE_SERVER}" >> $ENV_FILE
echo "CACHE_SERVER_NAME=${CACHE_SERVER_NAME}" >> $ENV_FILE
echo "INFINISPAN_USERNAME=${INFINISPAN_USERNAME}" >> $ENV_FILE
echo "INFINISPAN_PASSWORD=${INFINISPAN_PASSWORD}" >> $ENV_FILE
echo "COMPOSE_HTTP_TIMEOUT=1000" >> $ENV_FILE





GOOGLE_SVC_ACC_PATH=/root/.genny/sheets.googleapis.com-java-quickstart/token-secret-service-account.json
echo "GOOGLE_SVC_ACC_PATH=${GOOGLE_SVC_ACC_PATH}" >> $ENV_FILE

echo ""
echo "###### Run Settings ######"
cat $ENV_FILE

echo "FULL_MYSQL_URL=${FULL_MYSQL_URL}" >> $ENV_FILE


echo "{" > $ENV_FILE_APP
echo "\"REACT_APP_PROJECT_NAME\":\"${REACT_APP_PROJECT_NAME}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_QWANDA_API_URL\":\"${REACT_APP_QWANDA_API_URL}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_VERSION_NUMBER\":\"${REACT_APP_VERSION_NUMBER}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_BUILD_DATE\":\"${REACT_APP_BUILD_DATE}\"," >> $ENV_FILE_APP
echo "\"REACT_BRIDGE_HOST\":\"${REACT_BRIDGE_HOST}\"," >> $ENV_FILE_APP
echo "\"REACT_UPPY_HOST\":\"${REACT_UPPY_HOST}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_URL\":\"${REACT_APP_VERTX_URL}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_SERVICE_API\":\"${REACT_APP_VERTX_SERVICE_API}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_EVENTS_API\":\"${REACT_APP_VERTX_EVENTS_API}\"" >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_CMDS_API\":\"${REACT_APP_VERTX_CMDS_API}\"" >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_DATA_API\":\"${REACT_APP_VERTX_DATA_API}\"" >> $ENV_FILE_APP
echo "GOOGLE_SVC_ACC_PATH=${GOOGLE_SVC_ACC_PATH}" >> $ENV_FILE
echo "}" >> $ENV_FILE_APP
cat $ENV_FILE_APP


#find all the projects
for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`
do
   echo $i
done
