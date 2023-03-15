#!/bin/bash

../databaseScripts/mysql.sh < ./update_sqls/update_attribute_constraints.sql
../databaseScripts/mysql.sh < ./update_sqls/update_baseentity_constraints.sql
../databaseScripts/mysql.sh < ./update_sqls/update_baseentity_attribute_constraints.sql
../databaseScripts/mysql.sh < ./update_sqls/update_question_constraints.sql
../databaseScripts/mysql.sh < ./update_sqls/update_questionquestion_constraints.sql
../databaseScripts/mysql.sh < ./update_sqls/update_validation_constraints.sql
../databaseScripts/mysql.sh < ./update_sqls/create_datatype.sql
../databaseScripts/mysql.sh < ./update_sqls/create_userstore.sql
../databaseScripts/mysql.sh < ./update_sqls/create_capabilities.sql

