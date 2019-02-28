#!/bin/bash

# first parameter is the version of genny to checkout.
# we check the user has passed at least 1 argument 

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters";
    exit;
fi

# we define the version of genny we want to use 
genny_version=$1

# function help to git pull a project and void the ouput to null.
function git_project {

  # project name is the first argument passed to this function 
  project=$1
  echo "Fetching ${project}"
  # if the project has already been cloned, we update it 
  if [ -d $project ]; then
    $(cd ./${project} > /dev/null 2>&1 && git add . > /dev/null 2>&1)
    $(cd ./${project} > /dev/null 2>&1 && git stash > /dev/null 2>&1 ) # we stash all the current changes (maven does funny things)
    $(cd ./${project} > /dev/null 2>&1 && git pull  > /dev/null 2>&1) # we update the repo
  else
    # otherwise we clone it
    git clone https://github.com/genny-project/${project}  > /dev/null 2>&1 
  fi

  # we checkout master to ensure we have got the latest
  $(cd ./${project} > /dev/null 2>&1 && git checkout master > /dev/null 2>&1  && git pull > /dev/null 2>&1 )

  # we delete the current tag branch in case it's been checked out 
  $(cd ./${project} > /dev/null 2>&1 && git branch -d ${genny_version} > /dev/null 2>&1 )

  # we checkout the right tag matching the genny version
#  $(cd ./${project} > /dev/null 2>&1 && git checkout tags/${genny_version} -b ${genny_version}  > /dev/null 2>&1 ) # we update the repo
  $(cd ./${project} > /dev/null 2>&1 && git checkout  ${genny_version}  > /dev/null 2>&1 ) # we update the repo
}

# function help to git pull all the required projects
function git_projects {
  
  echo -ne '#                         (0%)\r'
  git_project genny-main 
  echo -ne '###                       (26%)\r'
  git_project qwanda 
  echo -ne '#                         (4%)\r'
  git_project qwanda-utils 
  echo -ne '###                       (22%)\r'
  git_project genny-verticle-rules 
  echo -ne '###                       (28%)\r'
  git_project genny-rules 
  echo -ne '#                         (6%)\r'
  git_project bridge 
  echo -ne '#####                     (32%)\r'
  git_project messages 
  echo -ne '##                        (8%)\r'
  git_project rulesservice 
  echo -ne '##                        (12%)\r'
  git_project keycloak 
  echo -ne '###                       (20%)\r'
  #git_project keycloak-themes 
  echo -ne '#####                     (30%)\r'
  git_project qwanda-services 
  echo -ne '#####                     (34%)\r'
  git_project wildfly-qwanda-service 
  echo -ne '#####                     (36%)\r'
  git_project wildfly-rulesservice 
  echo -ne '######                    (38%)\r'
  git_project alyson-v3 
  echo -ne '########                  (42%)\r'
  git_project alyson-7
  echo -ne '########                  (42%)\r'
  git_project uppy 
  echo -ne '##########                (46%)\r'
  git_project prj_genny 
  echo -ne '############              (49%)\r'
  git_project layouts 
  echo -ne '############              (50%)\r'
  git_project  checkrules 
  echo -ne '############              (50%)\r'
  git_project   keycloak-themes 
  echo -ne '############              (50%)\r'
  git_project   camelot 
  echo -ne '############              (50%)\r'
}

# function help to build a project
function build_project {
  
  # first argument is the project to build 
  project=$1

  # second argument is a boolean defining whether or not we need to build the docker image too 
  build_docker=$2

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

# git update all the projects 
git_projects

# build the new version of genny 
build_genny

# TODO: define the success event 
echo "Success."

#exit
say "finished on ${USER} mac"
exit;
