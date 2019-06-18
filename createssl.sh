#!/bin/bash
openssl req -x509 -out alyson7.genny.life.crt -keyout alyson7.genny.life.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <( \
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:alyson7.genny.life\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
