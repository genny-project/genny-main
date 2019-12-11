#!/bin/bash
mysql -P 3310 -h 127.0.0.1 -u genny --password=password gennydb  < ./clear-rules-in-database.sql
