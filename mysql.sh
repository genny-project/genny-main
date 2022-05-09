#!/bin/bash
mysql -h 0.0.0.0 -P 3310 -u $MYSQL_USERNAME --password=$MYSQL_PASSWORD gennydb
