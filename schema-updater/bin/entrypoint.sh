#!/bin/bash

DB_SERVER=${persistence_db_server_ip:-mysql}
USERNAME=${persistence_db_username:-genny}
PASSWORD=${persistence_db_password:-password}
DB=${persistence_db_name:-gennydb}
PORT=${persistencedb_server_port:-3306}

echo "Updating the database at: $DB_SERVER:$PORT/$DB , with the user $USERNAME ..."

processed_files=($(mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "SELECT sql_file_name FROM executed_scripts;"))
echo "List of already processed files: $processed_files"
#IFS='\n' read -r -a processed_files_arr <<< "$processed_files"
#echo "\n\nprocessed_files_arr -> $processed_files_arr"

declare -A processed_files_map
for filename in "${processed_files[@]}"
do
  processed_files_map["${filename}"]=1
done

while IFS= read -r line; do
  if [[ ! -z "$line" ]] && [[ ! "$line" == \#* ]];
  then
    if [ "${processed_files_map[$line]}" ] ;
    then
      echo "Already processed the file $line. Moving on.."
    else
      echo "Processing file: $line"
      mysql --host=$DB_SERVER --port=$PORT --user=$USERNAME --password=$PASSWORD $DB < "$line"
      echo "Running -> INSERT INTO executed_scripts VALUES('$line');"
      mysql --host=$DB_SERVER --port=$PORT --user=$USERNAME --password=$PASSWORD $DB -e "INSERT INTO executed_scripts VALUES('$line');"
    fi
  fi
done < files_to_be_run.txt

echo "Update complete."
