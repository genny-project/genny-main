#!/bin/bash
mysql -h 0.0.0.0 -P 3310 -u $GENNY_LOCAL_MYSQL_USER --password=$GENNY_LOCAL_MYSQL_PASSWORD gennydb
