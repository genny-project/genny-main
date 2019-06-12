#!/bin/bash
mysqldump  --no-create-info  -P 3310 -h 127.0.0.1 -u genny --password=password  --default-character-set=utf8  gennydb  > ../genny-data.sql
mysqldump --no-data -P 3310 -h 127.0.0.1 -u genny --password=password  --default-character-set=utf8  gennydb  > ../genny-schema.sql
