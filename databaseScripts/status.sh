#!/bin/bash
mysql -P 3310 -h 127.0.0.1 -t -u genny --password=password gennydb < status.sql
