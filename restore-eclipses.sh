#!/bin/bash
# This is used to restore the eclipse project details



function restore_project {
 project=$1
 pushd .
 cd ..
echo "Restoring eclipse project settings in project ${project}"
if cd ${project}; then
cp -rp .settings ~/projects/genny/${project}/
cp -rp .project ~/projects/genny/${project}/
cp -rp .factorypath ~/projects/genny/${project}/
    
fi
 popd
}

echo "Restore all eclipse all Genny projects!"

restore_project bridge
restore_project messages
restore_project rulesservice
restore_project qwanda
restore_project qwanda-utils
restore_project genny-verticle-rules
restore_project genny-rules
restore_project qwanda-services
restore_project wildfly-qwanda-service
restore_project wildfly-rulesservice
restore_project prj_genny
restore_project prj_internmatch
restore_project prj_butler
restore_project prj_pcss
restore_project prj_stt


echo "Finished loading in all the projects"
