#!/bin/bash
NEW_VERSION=${1}
OLD_VERSION=${2}
GITHUB_TOKEN=${4}
REPO=${3}
AUTH=genny-project

# Concatenating
NEW_BRANCH="v${NEW_VERSION}"
PREVIOUS_BRANCH="v${OLD_VERSION}"

echo "### GitHub Update ###"

if [ -z "$REPO" ]
then
    echo "REPO empty"
    exit 1
else
    echo "REPO: ${REPO}"
fi

if [ -z "$NEW_BRANCH" ]
then
    echo "NEW_BRANCH empty"
    exit 1
else
    echo "NEW_BRANCH: ${NEW_BRANCH}"
fi

if [ -z "$PREVIOUS_BRANCH" ]
then
    echo "PREVIOUS_BRANCH empty"
    exit 1
else
    echo "PREVIOUS_BRANCH: ${PREVIOUS_BRANCH}"
fi

# # Create new branch
# SHA=$(curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${AUTH}/${REPO}/git/refs/heads/${PREVIOUS_BRANCH} | jq -r '.object.sha')
# curl -X POST -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"ref\": \"refs/heads/${NEW_BRANCH}\",\"sha\": \"$SHA\"}"  https://api.github.com/repos/${AUTH}/${REPO}/git/refs

# # set default branch
# curl -X PATCH -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"name\": \"${REPO}\",\"default_branch\": \"$NEW_BRANCH\"}"  https://api.github.com/repos/${AUTH}/${REPO}

# # set branch protection rule
# curl  -X PUT -H "Authorization: token $GITHUB_TOKEN"  -H "Accept: application/vnd.github.luke-cage-preview+json"  https://api.github.com/repos/${AUTH}/${REPO}/branches/${NEW_BRANCH}/protection -d '{"required_status_checks":{"strict":true, "contexts":["continuous-integration/jenkins"]},"enforce_admins":false,"required_pull_request_reviews":{"required_approving_review_count":1}, "restrictions": null}'

# echo "### Maven Update ###"

# if [ -z "$NEW_VERSION" ]
# then
#     echo "NEW_VERSION empty"
#     exit 1
# else
#     echo "NEW_VERSION: ${NEW_VERSION}"
# fi

# if [ -z "$OLD_VERSION" ]
# then
#     echo "OLD_VERSION empty"
#     exit 1
# else
#     echo "OLD_VERSION: ${OLD_VERSION}"
# fi

# cd ~/projects/genny/genny-main/

# cd ../qwanda
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../qwanda-utils
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../genny-verticle-rules
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../genny-rules
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../bootxport
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../qwanda-services
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../wildfly-qwanda-service
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../wildfly-rulesservice
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../bridge
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../alyson
# git stash;git pull;git checkout ${NEW_BRANCH}
# cd ../prj_genny
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../prj_internmatch
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../messages
# git stash;git pull;git checkout ${NEW_BRANCH}
# mvn versions:set -DnewVersion=${NEW_VERSION}
# mvn versions:commit
# cd ../gennyteer
# git stash;git pull;git checkout ${NEW_BRANCH}
cd ../REPO
git stash;git pull;git checkout ${NEW_BRANCH}

# for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
#    cd ../$i
#    git stash;git pull
#    cd ../genny-main
#    echo $i
# done

# cd ../qwanda
# mvn clean install -DskipTests=true

# cd ../qwanda-utils
# mvn clean install -DskipTests=true

# cd ../bootxport
# mvn clean install -DskipTests=true

# cd ../genny-verticle-rules
# mvn clean install -DskipTests=true

# cd ../genny-rules
# mvn clean install -DskipTests=true

# cd ../qwanda-services
# mvn clean install -DskipTests=true

# cd ../wildfly-qwanda-service
# mvn clean package -DskipTests=true
# ./build-docker.sh

# cd ../wildfly-rulesservice
# mvn clean package -DskipTests=true
# ./build-docker.sh

# cd ../bridge
# mvn clean package -DskipTests=true
# ./build-docker.sh

# cd ../prj_genny
# ./build.sh
# ./build-docker.sh

# cd ../prj_internmatch
# ./build-docker.sh

# cd ../alyson/scripts
# ./build-docker.sh

# cd ../../gennyteer
# ./build-docker.sh

# cd ../genny-main

# echo "### Pushing Maven Update To Github ###"

# cd ../qwanda
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../qwanda-utils
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../bootxport
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../genny-verticle-rules
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../genny-rules
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../qwanda-services
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../wildfly-qwanda-service
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../wildfly-rulesservice
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../bridge
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../prj_genny
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../prj_internmatch
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../alyson/scripts
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

# cd ../../gennyteer
# git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}

cd ../REPO
git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}