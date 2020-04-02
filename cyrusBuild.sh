#!/bin/bash

DATE=$(date +%Y_%m_%d_%H_%M_%S)
echo $DATE
GENNY_PATH=..
HISTORY_FOLDER=$GENNY_PATH/.cyrus-history

if [ ! -d "$HISTORY_FOLDER" ]; then
   mkdir -p $HISTORY_FOLDER
fi

HISTORY_FILE=history_$DATE.txt
HISTORY_FILE_PATH=$HISTORY_FOLDER/$HISTORY_FILE
STATE_PATH=$HISTORY_FOLDER/build_state

echo This file was created on $DATE > $HISTORY_FILE_PATH

branchLatest="v3.1.0"

# if I'm on the latest branch with not changes git pull
isOnLatest(){
  currentBranch=$(git symbolic-ref --short HEAD)

  if [ $currentBranch == $branchLatest  ] && [ ! -n "$(git status --porcelain)" ];then
    git pull &> /dev/null
  fi
}


# if I'm on different branch with everything commited ->  git checkout $branchLatest && echo you work on this branch and everything was commited
isOnBranch(){
  currentBranch=$(git symbolic-ref --short HEAD)

  if [ $currentBranch != $branchLatest  ] && [ ! -n "$(git status --porcelain)" ];then
    git checkout $branchLatest &> /dev/null
    git pull &> /dev/null
    printf "\n\n#################### project $1 ####################\n\n" >> $HISTORY_FILE_PATH
    printf "In this project you were working on $currentBranch but have commited everything\n" >> $HISTORY_FILE_PATH
  fi

}

# if I'm on the latest branch with some changes -> git branch -b uuid && git add . && git commit -m "save changes on date $DATE" && git checkout $branchLatest
# && echo you work on this branch and this file were changed.git diff uuid --name-only please make not never push this branch remotely and make sure to inspect
# the changes before merging this branch to any other branch
isOnLatestWithChanges(){
  currentBranch=$(git symbolic-ref --short HEAD)

  uuid=$(uuidgen)

  if  [[  -n "$(git status --porcelain)" ]]; then
    git checkout -b $uuid &> /dev/null
    git add . &> /dev/null
    git commit -m "Saving changes from this date $DATE" &> /dev/null
    git checkout $branchLatest &> /dev/null
    res=$(git pull &> /dev/null)
    changes=$(git diff $uuid --name-only)
    printf "\n\n#################### project $1 ####################\n\n" >> $HISTORY_FILE_PATH
    printf "In this project you were working on $currentBranch but has some work in progress\n" >> $HISTORY_FILE_PATH
    echo "The files that has changed were the following: " >> $HISTORY_FILE_PATH
    arr=("$changes")
    for i in "${arr[@]}";
      do
        printf "\n$i\n\n" >> $HISTORY_FILE_PATH
      done
    echo "Your work has been saved on this branch $uuid" >> $HISTORY_FILE_PATH
  fi

}

pullLatest(){
  cd $1 &> /dev/null
  isOnLatest $1
  isOnBranch $1
  isOnLatestWithChanges $1
  cd - &> /dev/null
}

buildProject(){
  cd $1 &> /dev/null

  SECONDS=0
  echo "################## BUILDING $1 #########################"
  if [ -f "build.sh" ]; then
    res=$(./build.sh &> /dev/null)
    if [ $? != 0 ]; then
        echo "################## ALERT #########################"
        echo Build failure in this project $1
        echo $1 > $STATE_PATH
        exit
    fi
  fi

  if [ -f "build-docker.sh" ]; then
    res=$(./build-docker.sh)
    if [ $? != 0 ]; then
        echo "################## ALERT #########################"
        echo Build docker failure in this project $1
        echo $1 > $STATE_PATH
        exit
    fi
  fi

  duration=$SECONDS
  echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
  cd - &> /dev/null
}

# Git pull latest and save everything on a uuid branch

pullLatest ../alyson-v7
pullLatest ../qwanda
pullLatest ../qwanda-utils
pullLatest ../qwanda-services
pullLatest ../bootxport
pullLatest ../wildfly-qwanda-service
pullLatest ../genny-verticle-rules
pullLatest ../genny-rules
pullLatest ../wildfly-rulesservice
pullLatest ../bridge


# Very dumb way of building everything in order or build from a certain project
function buildAll(){
  case $1 in
    $GENNY_PATH/alyson-v7 )
      buildProject ../alyson-v7
      buildProject ../qwanda
      buildProject ../qwanda-utils
      buildProject ../qwanda-services
      buildProject ../bootxport
      buildProject ../wildfly-qwanda-service
      buildProject ../genny-verticle-rules
      buildProject ../genny-rules
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/qwanda )
      buildProject ../qwanda
      buildProject ../qwanda-utils
      buildProject ../qwanda-services
      buildProject ../bootxport
      buildProject ../wildfly-qwanda-service
      buildProject ../genny-verticle-rules
      buildProject ../genny-rules
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/qwanda-utils )
      buildProject ../qwanda-utils
      buildProject ../qwanda-services
      buildProject ../bootxport
      buildProject ../wildfly-qwanda-service
      buildProject ../genny-verticle-rules
      buildProject ../genny-rules
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/qwanda-services )
      buildProject ../qwanda-services
      buildProject ../bootxport
      buildProject ../wildfly-qwanda-service
      buildProject ../genny-verticle-rules
      buildProject ../genny-rules
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/bootxport )
      buildProject ../bootxport
      buildProject ../wildfly-qwanda-service
      buildProject ../genny-verticle-rules
      buildProject ../genny-rules
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/wildfly-qwanda-service )
      buildProject ../wildfly-qwanda-service
      buildProject ../genny-verticle-rules
      buildProject ../genny-rules
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/genny-verticle-rules )
      buildProject ../genny-verticle-rules
      buildProject ../genny-rules
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/genny-rules )
      buildProject ../genny-rules
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/wildfly-rulesservice )
      buildProject ../wildfly-rulesservice
      buildProject ../bridge
    shift
    ;;
    $GENNY_PATH/bridge )
      buildProject ../bridge
    shift
    ;;
    * )
      buildProject ../alyson-v7
      buildProject $GENNY_PATH/qwanda
      buildProject $GENNY_PATH/qwanda-utils
      buildProject $GENNY_PATH/qwanda-services
      buildProject $GENNY_PATH/bootxport
      buildProject $GENNY_PATH/wildfly-qwanda-service
      buildProject $GENNY_PATH/genny-verticle-rules
      buildProject $GENNY_PATH/genny-rules
      buildProject $GENNY_PATH/wildfly-rulesservice
      buildProject $GENNY_PATH/bridge
    ;;
  esac
  shift
}

if [ -f $STATE_PATH  ];then
    state=$(cat $STATE_PATH)
    buildAll $state
    rm $STATE_PATH
else
    buildAll "*"
fi

#echo -ne '#####                     (33%)\r'
#sleep 1
#echo -ne '#############             (66%)\r'
#sleep 1
#echo -ne '#######################   (100%)\r'
#echo -ne '\n'
