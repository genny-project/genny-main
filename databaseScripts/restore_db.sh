#!/bin/zsh
./mysql.sh < ../genny-schema.sql
cd ../schema-updater
./update_schema.sh
