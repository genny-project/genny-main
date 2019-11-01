#!/bin/bash

rm -Rf config

mkdir -p config
touch config/postfix-accounts.cf
docker run --rm \
  -e MAIL_USER=user1@domain.tld \
  -e MAIL_PASS=mypassword \
  -ti tvial/docker-mailserver:latest \
  /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"' >> config/postfix-accounts.cf

docker run --rm \
  -v "$(pwd)/config":/tmp/docker-mailserver \
  -ti tvial/docker-mailserver:latest generate-dkim-config
