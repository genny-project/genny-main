#!/bin/bash

ENV_FILE=$1

myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1 
fi



#create env file
REACT_APP_PROJECT_NAME="Docker Genny"
REACT_APP_QWANDA_API_URL=http://${myip}:8280
REACT_APP_VERSION_NUMBER=0.5
REACT_APP_BUILD_DATE=2017-07-12
REACT_APP_VERTX_URL=http://${myip}:8081/frontend
REACT_APP_VERTX_SERVICE_API=http://${myip}:8081/api/service
REACT_APP_VERTX_EVENTS_API=http://${myip}:8081/api/events

KEYCLOAK_PORT=8180
KEYCLOAK_PROTO="http://"
KEYCLOAK_USERNAME=user2
KEYCLOAK_SERVICE_ID=3f0c17d2-36f4-4b0d-8204-effadaedf4f2
KEYCLOAK_PASSWORD=password2
CORS_ALLOWED_ORIGINS="http://localhost:3000,http://localhost:5000"
KEYCLOAK_SECRET=6c61c6c3-aa68-419a-86e0-750a2517a3b0

SOCIAL_PORT=8083
SOCIAL_PROTO="http://"
FACEBOOK_CLIENTID=423902461306952
FACEBOOK_SECRET=a7bd50640f9914b95756ae8f5680751b

MYSQL_URL=mysql
MYSQL_DB=gennydb
MYSQL_PORT=3306
MYSQL_USER=genny
MYSQL_PASSWORD=password
MYSQL_ROOT_PASSWORD=password
MYSQL_ALLOW_EMPTY_PASSWORD=no
MYSQL_RANDOM_ROOT_PASSWORD=no
MYSQL_ROOT_HOST=${HOSTIP}

KIE_SERVER_URL="http://${HOSTIP}:8480/kie-server/services/rest/server"
KIE_USERNAME="kieserver"
KIE_PASSWORD="kieserver1!"



DEVUSER=${USER}
RULES_DIR=/opt/rules

JAVA_OPTS="-Xms256m -Xmx512m -Djava.net.preferIPv4Stack=true"

# Find the host's local lan ip
echo "HOSTIP=${myip}" > $ENV_FILE
echo "DEVUSER=${DEVUSER}" >> $ENV_FILE
echo "" >> $ENV_FILE
echo "REACT_APP_PROJECT_NAME=${REACT_APP_PROJECT_NAME}" >> $ENV_FILE
echo "REACT_APP_QWANDA_API_URL=${REACT_APP_QWANDA_API_URL}" >> $ENV_FILE
echo "REACT_APP_VERSION_NUMBER=${REACT_APP_VERSION_NUMBER}" >> $ENV_FILE
echo "REACT_APP_BUILD_DATE=${REACT_APP_BUILD_DATE}" >> $ENV_FILE
echo "REACT_APP_VERTX_URL=${REACT_APP_VERTX_URL}" >> $ENV_FILE
echo "REACT_APP_VERTX_SERVICE_API=${REACT_APP_VERTX_SERVICE_API}" >> $ENV_FILE
echo "REACT_APP_VERTX_EVENTS_API=${REACT_APP_VERTX_EVENTS_API}" >> $ENV_FILE
echo "" >> $ENV_FILE
echo "KEYCLOAKPORT=${KEYCLOAK_PORT}" >> $ENV_FILE
echo "KEYCLOAKPROTO=${KEYCLOAK_PROTO}" >> $ENV_FILE
echo "KEYCLOAKURL=${KEYCLOAK_PROTO}${myip}:${KEYCLOAK_PORT}/auth" >> $ENV_FILE
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
echo "MYSQL_RANDOM_ROOT_PASSWORD=${MYSQL_RANDOM_ROOT_PASSWORD}" >> $ENV_FILE
echo "RULES_DIR=${RULES_DIR}" >> $ENV_FILE

echo "KIE_SERVER=${KIE_SERVER_URL}" >> $ENV_FILE
echo "KIE_USERNAME=${KIE_USERNAME}" >> $ENV_FILE
echo "KIE_PASSWORD=${KIE_PASSWORD}" >> $ENV_FILE

echo "SOCIAL_PORT=${SOCIAL_PORT}" >> $ENV_FILE
echo "SOCIAL_PROTO=${SOCIAL_PROTO}" >> $ENV_FILE
echo "FACEBOOK_CLIENTID=${FACEBOOK_CLIENTID}" >> $ENV_FILE
echo "FACEBOOK_SECRET=${FACEBOOK_SECRET}" >> $ENV_FILE

echo "JAVA_OPTS=${JAVA_OPTS}" >> $ENV_FILE

echo ""
echo "###### Run Settings ######"
cat $ENV_FILE

