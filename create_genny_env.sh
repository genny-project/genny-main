#!/bin/bash

ENV_FILE=$1
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

docker volume create cassandra_data
docker volume create mysql_data

#create env file
REACT_APP_PROJECT_NAME="Docker Genny"
REACT_APP_QWANDA_API_URL=http://${myip}:8280
REACT_APP_VERSION_NUMBER=0.5
REACT_APP_BUILD_DATE=2017-07-12
REACT_BRIDGE_HOST=http://${myip}:8088
REACT_APP_VERTX_URL=${REACT_BRIDGE_HOST}/frontend
REACT_APP_VERTX_SERVICE_API=${REACT_BRIDGE_HOST}/api/service
REACT_APP_VERTX_EVENTS_API=${REACT_BRIDGE_HOST}/api/events
REACT_APP_VERTX_CMDS_API=${REACT_BRIDGE_HOST}/api/cmds
REACT_APP_VERTX_DATA_API=${REACT_BRIDGE_HOST}/api/data

PAYMENT_SERVICE_API_URL=http://${myip}:3456
PAYMENT_PROVIDER=assembly
PAYMENT_MARKETPLACE_NAME=test
PAYMENT_TOKEN=
PAYMENT_SECRET=
PAYMENTS_PASSWORD=
PAYMENTS_EMAIL=

KEYCLOAK_PORT=8180
KEYCLOAK_PROTO="http://"
KEYCLOAK_USERNAME=admin
KEYCLOAK_PASSWORD=admin
CORS_ALLOWED_ORIGINS="http://localhost:3000,http://localhost:5000"

FACEBOOK_CALLBACK_URL=https://social.outcome-hub.com
FACEBOOK_CLIENTID=423902461306952
FACEBOOK_SECRET=a7bd50640f9914b95756ae8f5680751b
SOCIAL_CALLBACK_URL=http://localhost:5000/

MYSQL_URL=mysql
MYSQL_DB=gennydb
MYSQL_PORT=3306
MYSQL_USER=genny
MYSQL_PASSWORD=password
MYSQL_ROOT_PASSWORD=password
MYSQL_ALLOW_EMPTY_PASSWORD=no
MYSQL_RANDOM_ROOT_PASSWORD=no
MYSQL_ROOT_HOST=${HOSTIP}

KIE_SERVER_URL="http://${myip}:8230/kie-server/services/rest/server"
KIE_USERNAME="kieserver"
KIE_PASSWORD="kieserver1!"

#GOOGLE_CLIENT_SECRET="{\"installed\":{\"client_id\":\"260075856207-9d7a02ekmujr2bh7i53dro28n132iqhe.apps.googleusercontent.com\",\"project_id\":\"genny-sheets-181905\",\"auth_uri\":\"https:\/\/accounts.google.com\/o\/oauth2\/auth\",\"token_uri\":\"https:\/\/accounts.google.com\/o\/oauth2\/token\",\"auth_provider_x509_cert_url\":\"https:\/\/www.googleapis.com\/oauth2\/v1\/certs\",\"client_secret\":\"vgXEFRgQvh3_t_e5Hj-eb6IX\",\"redirect_uris\":[\"urn:ietf:wg:oauth:2.0:oob\",\"http:\/\/localhost\"]}}"

#GOOGLE_HOSTING_SHEET_ID="1HAppJufvePWSiSyvPkxNfZp6NHdB8PANeH1IJopdEsE"

DEVUSER=${USER}
RULES_DIR=/opt/rules

# Twilio test account credentials

TWILIO_ACCOUNT_SID=ACce3f27260613a28b147ba62619bde66b
TWILIO_AUTH_TOKEN=653ce7a458bbb0e2dbf82b4adecb0dbe

TWILIO_SOURCE_PHONE=+61400019407

# Email credentials

EMAIL_USERNAME=genny.life.user@gmail.com
EMAIL_PASSWORD=WelcomeToTheGenny121!!

# Mail Transfer Protocol variables

MAIL_SMTP_AUTH=true
MAIL_SMTP_STARTTLS_ENABLE=true
MAIL_SMTP_HOST=smtp.gmail.com
MAIL_SMTP_PORT=587


JAVA_OPTS="-Xms256m -Xmx512m -Djava.net.preferIPv4Stack=true"

# Find the host's local lan ip
echo "HOSTIP=${myip}" > $ENV_FILE
echo "DEVUSER=${DEVUSER}" >> $ENV_FILE
echo "" >> $ENV_FILE
#echo "GOOGLE_HOSTING_SHEET_ID=${GOOGLE_HOSTING_SHEET_ID}" >> $ENV_FILE
#echo "GOOGLE_CLIENT_SECRET=${GOOGLE_CLIENT_SECRET}" >> $ENV_FILE
echo "REACT_APP_PROJECT_NAME=${REACT_APP_PROJECT_NAME}" >> $ENV_FILE
echo "REACT_APP_QWANDA_API_URL=${REACT_APP_QWANDA_API_URL}" >> $ENV_FILE
echo "REACT_APP_VERSION_NUMBER=${REACT_APP_VERSION_NUMBER}" >> $ENV_FILE
echo "REACT_APP_BUILD_DATE=${REACT_APP_BUILD_DATE}" >> $ENV_FILE
echo "REACT_BRIDGE_HOST=${REACT_BRIDGE_HOST}" >> $ENV_FILE
echo "REACT_APP_VERTX_URL=${REACT_APP_VERTX_URL}" >> $ENV_FILE
echo "REACT_APP_VERTX_SERVICE_API=${REACT_APP_VERTX_SERVICE_API}" >> $ENV_FILE
echo "REACT_APP_VERTX_EVENTS_API=${REACT_APP_VERTX_EVENTS_API}" >> $ENV_FILE
echo "REACT_APP_VERTX_CMDS_API=${REACT_APP_VERTX_CMDS_API}" >> $ENV_FILE
echo "REACT_APP_VERTX_DATA_API=${REACT_APP_VERTX_DATA_API}" >> $ENV_FILE

echo "PAYMENT_SERVICE_API_URL=${PAYMENT_SERVICE_API_URL}" >> $ENV_FILE
echo "PAYMENT_PROVIDER=${PAYMENT_PROVIDER}" >> $ENV_FILE
echo "PAYMENT_MARKETPLACE_NAME=${PAYMENT_MARKETPLACE_NAME}" >> $ENV_FILE
echo "PAYMENT_TOKEN=${PAYMENT_TOKEN}" >> $ENV_FILE
echo "PAYMENT_SECRET=${PAYMENT_SECRET}" >> $ENV_FILE
echo "PAYMENTS_PASSWORD=${PAYMENTS_PASSWORD}" >> $ENV_FILE
echo "PAYMENTS_EMAIL=${PAYMENTS_EMAIL}" >> $ENV_FILE

# Credentials for message
echo "TWILIO_ACCOUNT_SID=${TWILIO_ACCOUNT_SID}" >> $ENV_FILE
echo "TWILIO_AUTH_TOKEN=${TWILIO_AUTH_TOKEN}" >> $ENV_FILE
echo "TWILIO_SOURCE_PHONE=${TWILIO_SOURCE_PHONE}" >> $ENV_FILE
echo "EMAIL_USERNAME=${EMAIL_USERNAME}" >> $ENV_FILE
echo "EMAIL_PASSWORD=${EMAIL_PASSWORD}" >> $ENV_FILE
echo "MAIL_SMTP_AUTH=${MAIL_SMTP_AUTH}" >> $ENV_FILE
echo "MAIL_SMTP_STARTTLS_ENABLE=${MAIL_SMTP_STARTTLS_ENABLE}" >> $ENV_FILE
echo "MAIL_SMTP_HOST=${MAIL_SMTP_HOST}" >> $ENV_FILE
echo "MAIL_SMTP_PORT=${MAIL_SMTP_PORT}" >> $ENV_FILE

echo "" >> $ENV_FILE
echo "KEYCLOAKPORT=${KEYCLOAK_PORT}" >> $ENV_FILE
echo "KEYCLOAKPROTO=${KEYCLOAK_PROTO}" >> $ENV_FILE
echo "KEYCLOAKURL=${KEYCLOAK_PROTO}${myip}:${KEYCLOAK_PORT}" >> $ENV_FILE
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

echo "FACEBOOK_CALLBACK_URL=${FACEBOOK_CALLBACK_URL}" >> $ENV_FILE
echo "FACEBOOK_CLIENTID=${FACEBOOK_CLIENTID}" >> $ENV_FILE
echo "FACEBOOK_SECRET=${FACEBOOK_SECRET}" >> $ENV_FILE
echo "SOCIAL_CALLBACK_URL=${SOCIAL_CALLBACK_URL}" >> $ENV_FILE
echo "JAVA_OPTS=${JAVA_OPTS}" >> $ENV_FILE

echo ""
echo "###### Run Settings ######"
cat $ENV_FILE


echo "{" > $ENV_FILE_APP
echo "\"REACT_APP_PROJECT_NAME\":\"${REACT_APP_PROJECT_NAME}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_QWANDA_API_URL\":\"${REACT_APP_QWANDA_API_URL}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_VERSION_NUMBER\":\"${REACT_APP_VERSION_NUMBER}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_BUILD_DATE\":\"${REACT_APP_BUILD_DATE}\"," >> $ENV_FILE_APP
echo "\"REACT_BRIDGE_HOST\":\"${REACT_BRIDGE_HOST}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_URL\":\"${REACT_APP_VERTX_URL}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_SERVICE_API\":\"${REACT_APP_VERTX_SERVICE_API}\"," >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_EVENTS_API\":\"${REACT_APP_VERTX_EVENTS_API}\"" >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_CMDS_API\":\"${REACT_APP_VERTX_CMDS_API}\"" >> $ENV_FILE_APP
echo "\"REACT_APP_VERTX_DATA_API\":\"${REACT_APP_VERTX_DATA_API}\"" >> $ENV_FILE_APP
echo "}" >> $ENV_FILE_APP
cat $ENV_FILE_APP






