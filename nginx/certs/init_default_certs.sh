#!/bin/bash
echo "Generating genny.life self signed certs"
declare -a arr=("keycloak" "alyson" "alyson3" "alyson2" "bridge" "qwanda-service" "api" "rulesservice" "messages" "social" "uppy" "layout-cache" "twilio" "payments" "internmatch" "mentormatch" "credmatch" "lojing")
for i in "${arr[@]}"
do
echo "Generating ${i} cert"
openssl req -x509 -newkey rsa:2048 -keyout my.pass.key -out ${i}.genny.life.crt -days 1365 -subj "/C=AU/ST=VIC/L=Warracknabeal/O=Genny.Life/OU=Org/CN=${i}.genny.life" -passout pass:ABCDABCD
openssl rsa -in my.pass.key -out ${i}.genny.life.key -passin pass:ABCDABCD
rm -f my.pass.key
done
