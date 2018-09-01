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
    ./build.sh
else 
    git clone https://github.com/genny-project/${project} ${project}; 
fi
 popd
}

function git_project_docker {
 project=$1
 pushd .
 cd ..
echo "Synching in project ${project}"
if cd ${project}; then 
    git stash;
    git checkout ${version} 
    git pull; 
    ./build.sh
    ./build-docker.sh ${version}
    docker push gennyproject/${project}:${version} 
else 
    git clone https://github.com/genny-project/${project} ${project}; 
    ./build.sh
    ./build-docker.sh ${version}
    docker push gennyproject/${project}:${version} 
fi
 popd
}
echo "Git pull all Genny projects!"

#git_project scoring
git_project qwanda
git_project qwanda-utils
git_project genny-verticle
git_project qwanda-services
git_project_docker bridge
git_project_docker messages
git_project_docker rulesservice
git_project_docker pontoon 
git_project_docker wildfly-qwanda-service
git_project social_docker
git_project payments
git_project gennyql 
git_project keycloak
git_project keycloak-themes
git_project kie-client
git_project alyson-v2
git_project qwanda-ql
git_project uppy
git_project in-app-calling
git_project_docker prj_channel40
git_project_docker prj_fourdegrees
git_project_docker prj_internmatch
git_project_docker prj_butler
git_project_docker prj_pcss


echo "Finished loading in all the projects"
