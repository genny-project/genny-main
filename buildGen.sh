#!/bin/bash
green='\033[0;32m'
red='\033[0;31m'
blue='\033[0;34m'
color_Off='\033[0m'       # Text Reset
{
        checkCPU()
        {
                echo -e "${blue}--CPU Utilization${color_off}";
                cd ../
                coreValue="$(nproc)"
                echo -e "${green}--Number of cores is${color_off}" $coreValue;
                echo '------------------'
                top
        }

        runGenny()
        {
                echo -e "${blue}--Run all Genny services${color_off}";
                ./run.sh dev1 up

                if (( $(echo $?) > 0)); then
	        	echo -e "${red}Fail to run all genny services${color_off}";			      
		else
			 echo -e "${green}Ran successfully${color_off}";
                        checkCPU 
                 fi
        }

         buildGenny()
        {
                echo -e "${blue}--Build all Genny services${color_off}";
                ./cyrusBuild.sh
                docker ps

                if (( $(echo $?) > 0)); then
			     echo -e "${red}Build failed${color_off}";
			     else
			 echo -e "${green}Build successfully${color_off}";
			 echo 'buildgenny';
                        runGenny 	      
                fi
        }

         stopContainers()
        {
                #List down the running docker containers
                docker ps
                echo -e "${blue}--Stop all docker containers${color_off}";
                #./stop.sh
                ./teardown.sh
                #List down the running docker containers
                docker container ls
                if [ $( docker ps -a | grep gennyproject/media-proxy:latest | wc -l ) != 0 ]; then
			echo -e "${red}Some docker containers exist${color_off}";
			else
			 echo -e "${green}Docker container does not exist${color_off}";
                        buildGenny 
                fi
        }

	checkTmpDirectory()
	{
		if [[ ! -d /tmp ]];
			then  echo -e "${red}tmp directory doesn't exist${color_off}";
				else
                 restoreDB 
                fi
	}

	checkMYSQLContainer()
	{
		if [ $( docker ps -a | grep mysql:8.0 | wc -l ) != 0 ]; then
                        echo -e "${green}MySQL containers exist${color_off}";
                        else
                         echo -e "${red}MYSQL container does not exist${color_off}";
			 cd ../genny-main/
                        ./run-setup.sh mysql
                fi

		if (( $(echo $?) > 0)); then
                        echo -e "${red}Fail to get latest${color_off}";
                 else
                        echo -e "${green}Get latest has been successful${color_off}";
                #       restoreDB
                	checkTmpDirectory
                fi
	} 

        restoreDB()
        {	
                cd ../genny-main/
                echo -e "${blue}--Restoring the DataBase with latest backup from the production${color_off}";
                #Find the existing sql file from the tmp directory
                sqlFile=$(find ./tmp/* -name "*.sql");
               # echo -e "${green}--SQL file:------${color_off}" $sqlFile ;
                #Get the size of the existing sql file
                fileSize=$(ls -l $sqlFile | awk '{print $5}');
                echo -e "${green}First sql file size${color_off}" $fileSize;

                #Restore the database
       		 #./restore-db.sh internmatch
		./restore-db.sh alyson.genny.life
                #Find the restored sql file from the tmp directory
                restoredFile=$(find ./tmp/* -name "*.sql");
                echo -e "${green}--Restored SQL file:-----${color_off}" $restoredFile;
                #Get the size of the restored sql file
                resSize=$(ls -l $restoredFile | awk '{print $5}');
                echo -e "${green}Restored sql file size${color_off}" $resSize;

                #Compare the file sizes
                 if [[ $fileSize -ne $resSize ]]; then
			echo -e "${green}--Succesfully restored the database${color_off}";
                        stopContainers
		       
		elif [[ $fileSize = $resSize ]]; then
			echo -e "${green}--Already restored the current database backup${color_off}";
                        stopContainers 
		else
			echo -e "${red}--Fail to restore the DB${color_off}";
                        #Show the latest backups
                       # ~/latest_gennydb_backups.sh 
		 fi
	      	 if (( $(echo $?) > 0)); then
                       echo -e "${red}--Fail to restore the DB${color_off}";      
                fi
        }

        getlatest()
        {
                echo -e "${blue}--Get latest all repositories${color_off}";
                for value in fyodor bridge kogitoq wildfly-rulesservice prj_internmatch serviceq checkrules notes shleemy dropkick genny-verticle-rules alyson genny-main qwanda api2email genny-proxy lauchy qwandaq bootq gennyq media-proxy qwanda-services bootxport genny-rules messages qwanda-utils
                do
                        echo -e "${green}--Service name -${color_off}" $value;
                        cd ../$value
                        git pull;
                done

                if (( $(echo $?) > 0)); then
			 echo -e "${red}Fail to get latest${color_off}";	 
		 else
			  echo -e "${green}Get latest has been successful${color_off}";
               
		checkMYSQLContainer 
                fi
        }
        getlatest

}||
{
        echo -e "${red}--------Fail build genny${color_off}";
}

