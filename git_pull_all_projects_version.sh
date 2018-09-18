#!/bin/bash
version=$1
echo "Version is ${version}"
function git_project {
 project=$1
 pushd .
 cd ..
echo "Synching in project ${project}"
if cd ${project}; then 
    git stash;
    git checkout ${version} 
    git pull; 
    mvn install -DskipTests=true
#    ./build.sh
else 
    git clone https://github.com/genny-project/${project} ${project}; 
fi
 popd
}

function git_docker {
 project=$1
 github=$2
if [ -z ${github+x} ]; then
  github=genny-project;
fi
 pushd .
 cd ..
echo "Synching in project ${project}"
if cd ${project}; then 
    git stash;
    git checkout ${version} 
    git pull; 
    ./build-docker.sh ${version}
    docker push gennyproject/${project}:${version} 
else 
    git clone https://github.com/${github}/${project} ${project}; 
    ./build-docker.sh ${version}
    
    docker push gennyproject/${project}:${version} 
fi
 popd
}

function git_project_docker {
 project=$1
 github=$2
if [ -z ${github+x} ]; then
  github=genny-project;
fi
 pushd .
 cd ..
echo "Synching in project ${project}"
if cd ${project}; then 
    git stash;
    git checkout ${version} 
    git pull; 
    mvn package -DskipTests=true
#    ./build.sh
    ./build-docker.sh ${version}
#    docker push gennyproject/${project}:${version} 
else 
    git clone https://github.com/${github}/${project} ${project}; 
    mvn package -DskipTests=true
#    ./build.sh
    ./build-docker.sh ${version}
    
#    docker push gennyproject/${project}:${version} 
fi
 popd
}
echo "Git pull all Genny projects!"

#git_project scoring
git_project qwanda
git_project qwanda-utils
git_project genny-verticle
git_project qwanda-services
git_project_docker bridge &
git_project_docker messages &
git_project_docker rulesservice &
git_project_docker pontoon  &
git_project_docker wildfly-qwanda-service &
git_project_docker social
git_docker payments &
git_project gennyql  &
git_project keycloak &
git_project keycloak-themes &
#git_project kie-client
git_docker alyson-v2 &
git_docker alyson-v3 &
#git_project qwanda-ql
git_docker uppy &
git_docker in-app-calling &
git_docker prj_channel40 channel40 
git_docker prj_fourdegrees OutcomeLife
git_docker prj_internmatch OutcomeLife
git_docker prj_butler OutcomeLife
git_docker prj_pcss OutcomeLife


echo "Finished loading in all the projects"
