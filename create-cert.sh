#!/bin/bash
domain=$1
openssl genrsa -des3 -out server.key 1024
openssl req -new -key server.key -out server.csr
cp -f server.key server.key.org
openssl rsa -in server.key.org -out server.key
openssl x509 -req -days 1000 -in server.csr -signkey server.key -out server.crt
cp -f server.crt nginx/certs/${domain}.crt
cp -f server.key nginx/certs/${domain}.key
