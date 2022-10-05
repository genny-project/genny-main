#!/bin/bash
echo "Generating genny.life self signed certs"
declare -a arr=("keycloak" "alyson" "alyson3" "alyson2" "bridge" "qwanda-service" "api" "rulesservice" "messages" "social" "uppy" "layout-cache" "twilio" "payments" "internmatch" "mentormatch" "lojing" "credmatch" "gadatron")
for i in "${arr[@]}"
do
# openssl req -x509 -newkey rsa:2048 -keyout my.pass.key -out ${i}.genny.life.crt -days 1365 -subj "/C=AU/ST=VIC/L=Warracknabeal/O=Genny.Life/OU=Org/CN=${i}.genny.life" -passout pass:ABCDABCD
# openssl rsa -in my.pass.key -out ${i}.genny.life.key -passin pass:ABCDABCD
# rm -f my.pass.key

openssl genrsa -out ${i}.genny.life.key 2048
openssl req -new -key ${i}.genny.life.key -out ${i}.genny.life.csr -subj "/C=AU/ST=VIC/L=Warracknabeal/O=Genny.Life/OU=Org/CN=${i}.genny.life" -addext "subjectAltName = DNS:${i}.genny.life,IP:127.0.0.1,IP:192.168.1.1,IP:10.123.123.123" -addext "extendedKeyUsage=serverAuth"
openssl x509 -req -days 3650 -in ${i}.genny.life.csr -signkey ${i}.genny.life.key -out ${i}.genny.life.crt

rm -f ${i}.genny.life.csr

done

