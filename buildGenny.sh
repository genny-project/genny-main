#!/bin/bash


# function help to build a project
function build_project {
  
  # first argument is the project to build 
  project=$1

  # second argument is a boolean defining whether or not we need to build the docker image too 
  build_docker=$2

 # if git changed
if git diff-index --quiet HEAD --; then
    # No changes
    echo "No change so no build"
else
    # Changes
  # we change the directory to the project we want to build and build it

  # if the boolean is true, we build the docker image 
  if [ "$build_docker" = true ] ; then
    cd ./${project}
    mvn package -DskipTests=true
    docker build -t gennyproject/${project}  . 
   # $(cd ./${project} > /dev/null 2>&1 && mvn package -DskipTests=true > /dev/null 2>&1 )
   # $(cd ./${project} > /dev/null 2>&1 && ./build-docker.sh  > /dev/null 2>&1 )
  else
    cd ./${project}
    mvn install -DskipTests=true
   # $(cd ./${project} > /dev/null 2>&1 && mvn install -DskipTests=true > /dev/null 2>&1 )
  fi
fi

  cd ..
}

# function help to build all the required projects 
function build_genny {

  build_project qwanda false
  echo -ne '##############            (55%)\r'

  build_project qwanda-utils false
  echo -ne '################          (60%)\r'

  build_project genny-verticle-rules false
  echo -ne '###################       (65%)\r'

  build_project genny-rules false
  echo -ne '#####################     (80%)\r'
  
  build_project qwanda-services false
  echo -ne '##################        (70%)\r'

  build_project bridge true
  echo -ne '######################    (85%)\r'

  build_project messages true
  echo -ne '######################    (85%)\r'
  
  build_project rulesservice true
  echo -ne '##########################(100%)\r'
  
  build_project wildfly-qwanda-service true
  echo -ne '####################      (75%)\r'
  
  build_project wildfly-rulesservice true
  echo -ne '####################      (75%)\r'

  build_project checkrules true
  echo -ne '##########################(100%)\r'
}

echo "Upgrading Genny to version ${genny_version}. Please wait, this could take up to 30 minutes..."

cd ..

# build the new version of genny 
build_genny

# TODO: define the success event 
echo "Success."

#exit
say "finished on ${USER} mac"
exit;
