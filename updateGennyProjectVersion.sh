#!/bin/bash
if [ $# -ne 3 ]
then
   echo "usage: updateGennyProjectVersion  <OLD_VERSION> <NEW_VERSION> <GITHUB_TOKEN>"
   echo "e.g. ./updateGennyProjectVersion.sh v7.1.0 v7.2.0 6576sd5f76d5f76576 "
   exit;
fi


OLD_VERSION=${1}
NEW_VERSION=${2}
GITHUB_TOKEN=${3}
AUTH=genny-project
PRIVATE_AUTH=OutcomeLife

# Concatenating
NEW_BRANCH="${NEW_VERSION}"
PREVIOUS_BRANCH="${OLD_VERSION}"

echo "### GitHub Update ###"

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

# repo, repo2, repo3 need both branch and version in pom.xml update
repos1=("genny-main" "qwanda" "qwanda-utils" "bootxport" "genny-verticle-rules" "qwanda-services"
"genny-rules" "wildfly" "wildfly-rulesservice" "wildfly-qwanda-service" "checkrules"  "bridge" "notes" "shleemy"
"media-proxy" "messages" "genny-proxy" "bootq" "prj_genny" "qwandaq" "serviceq" "genny-test-service" "fyodor" "dropkick" "lauchy" "kogitoq")

repos2=("alyson" "alyson-v9")

repos3=("prj_stt" "prj_internmatch" "prj_mentormatch" "prj_lojing" "api2email")

# repos4 in public org , only need branch update
repos4=("gennyq")

#repos5 in private org , only need branch update
repos5=("genny-charts" "gennyteer")

# check jq
which jq
RESULT=$?
if [ $RESULT -eq 0 ]; then
    echo "jq installed, OK"
else
    echo "Can not find jq, please install first."
    exit 1
fi

echo "### repos set 1 ###"

for REPO in "${repos1[@]}"; do
    # Create new branch
    SHA=$(curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${AUTH}/${REPO}/git/refs/heads/${PREVIOUS_BRANCH} | jq -r '.object.sha')
    curl -X POST -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"ref\": \"refs/heads/${NEW_BRANCH}\",\"sha\": \"$SHA\"}"  https://api.github.com/repos/${AUTH}/${REPO}/git/refs

    # set default branch
    curl -X PATCH -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"name\": \"${REPO}\",\"default_branch\": \"$NEW_BRANCH\"}"  https://api.github.com/repos/${AUTH}/${REPO}

    # set branch protection rule
    curl  -X PUT -H "Authorization: token $GITHUB_TOKEN"  -H "Accept: application/vnd.github.luke-cage-preview+json"  https://api.github.com/repos/${AUTH}/${REPO}/branches/${NEW_BRANCH}/protection -d '{"required_status_checks":{"strict":true, "contexts":["continuous-integration/jenkins"]},"enforce_admins":false,"required_pull_request_reviews":{"required_approving_review_count":1}, "restrictions": null}'

done

echo "### repos set 2 ###"

for REPO in "${repos2[@]}"; do
    # Create new branch
    SHA=$(curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${AUTH}/${REPO}/git/refs/heads/${PREVIOUS_BRANCH} | jq -r '.object.sha')
    curl -X POST -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"ref\": \"refs/heads/${NEW_BRANCH}\",\"sha\": \"$SHA\"}"  https://api.github.com/repos/${AUTH}/${REPO}/git/refs

    # set default branch
    curl -X PATCH -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"name\": \"${REPO}\",\"default_branch\": \"$NEW_BRANCH\"}"  https://api.github.com/repos/${AUTH}/${REPO}

    # set branch protection rule
    curl  -X PUT -H "Authorization: token $GITHUB_TOKEN"  -H "Accept: application/vnd.github.luke-cage-preview+json"  https://api.github.com/repos/${AUTH}/${REPO}/branches/${NEW_BRANCH}/protection -d '{"required_status_checks":{"strict":true, "contexts":["continuous-integration/jenkins"]},"enforce_admins":false,"required_pull_request_reviews":{"required_approving_review_count":1}, "restrictions": null}'

done

echo "### repos set 3 ###"

for REPO in "${repos3[@]}"; do
    # Create new branch
    SHA=$(curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${PRIVATE_AUTH}/${REPO}/git/refs/heads/${PREVIOUS_BRANCH} | jq -r '.object.sha')
    curl -X POST -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"ref\": \"refs/heads/${NEW_BRANCH}\",\"sha\": \"$SHA\"}"  https://api.github.com/repos/${PRIVATE_AUTH}/${REPO}/git/refs

    # set default branch
    curl -X PATCH -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"name\": \"${REPO}\",\"default_branch\": \"$NEW_BRANCH\"}"  https://api.github.com/repos/${PRIVATE_AUTH}/${REPO}

    # set branch protection rule
    curl  -X PUT -H "Authorization: token $GITHUB_TOKEN"  -H "Accept: application/vnd.github.luke-cage-preview+json"  https://api.github.com/repos/${PRIVATE_AUTH}/${REPO}/branches/${NEW_BRANCH}/protection -d '{"required_status_checks":{"strict":true, "contexts":["continuous-integration/jenkins"]},"enforce_admins":false,"required_pull_request_reviews":{"required_approving_review_count":1}, "restrictions": null}'

done

echo "### repos set 4 ###"

for REPO in "${repos4[@]}"; do
    # Create new branch
    SHA=$(curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${AUTH}/${REPO}/git/refs/heads/${PREVIOUS_BRANCH} | jq -r '.object.sha')
    curl -X POST -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"ref\": \"refs/heads/${NEW_BRANCH}\",\"sha\": \"$SHA\"}"  https://api.github.com/repos/${AUTH}/${REPO}/git/refs

    # set default branch
    curl -X PATCH -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"name\": \"${REPO}\",\"default_branch\": \"$NEW_BRANCH\"}"  https://api.github.com/repos/${AUTH}/${REPO}

    # set branch protection rule
    curl  -X PUT -H "Authorization: token $GITHUB_TOKEN"  -H "Accept: application/vnd.github.luke-cage-preview+json"  https://api.github.com/repos/${AUTH}/${REPO}/branches/${NEW_BRANCH}/protection -d '{"required_status_checks":{"strict":true, "contexts":["continuous-integration/jenkins"]},"enforce_admins":false,"required_pull_request_reviews":{"required_approving_review_count":1}, "restrictions": null}'

done

echo "### repos set 5 ###"

for REPO in "${repos5[@]}"; do
    # Create new branch
    SHA=$(curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${PRIVATE_AUTH}/${REPO}/git/refs/heads/${PREVIOUS_BRANCH} | jq -r '.object.sha')
    curl -X POST -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"ref\": \"refs/heads/${NEW_BRANCH}\",\"sha\": \"$SHA\"}"  https://api.github.com/repos/${PRIVATE_AUTH}/${REPO}/git/refs

    # set default branch
    curl -X PATCH -H "Authorization: token $GITHUB_TOKEN"  -d  "{\"name\": \"${REPO}\",\"default_branch\": \"$NEW_BRANCH\"}"  https://api.github.com/repos/${PRIVATE_AUTH}/${REPO}

    # set branch protection rule
    curl  -X PUT -H "Authorization: token $GITHUB_TOKEN"  -H "Accept: application/vnd.github.luke-cage-preview+json"  https://api.github.com/repos/${PRIVATE_AUTH}/${REPO}/branches/${NEW_BRANCH}/protection -d '{"required_status_checks":{"strict":true, "contexts":["continuous-integration/jenkins"]},"enforce_admins":false,"required_pull_request_reviews":{"required_approving_review_count":1}, "restrictions": null}'

done

echo "### Maven Update ###"

if [ -z "$NEW_VERSION" ]
then
    echo "NEW_VERSION empty"
    exit 1
else
    echo "NEW_VERSION: ${NEW_VERSION}"
fi

if [ -z "$OLD_VERSION" ]
then
    echo "OLD_VERSION empty"
    exit 1
else
    echo "OLD_VERSION: ${OLD_VERSION}"
fi

parentdir="$HOME/projects/genny"

echo "### Pushing Maven Update To Github ###"
for REPO in "${repos1[@]}"; do
   echo $REPO
   cd $parentdir/$REPO
   git stash;git pull;git checkout ${NEW_BRANCH}
   mvn versions:set -DnewVersion=${NEW_VERSION}
   mvn versions:commit; mvn clean install
   git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}
done

for REPO in "${repos3[@]}"; do
   echo $REPO
   cd $parentdir/$REPO
   git stash;git pull;git checkout ${NEW_BRANCH}
   mvn versions:set -DnewVersion=${NEW_VERSION}
   mvn versions:commit; mvn clean install
   git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}
done

echo "### Alysom Version Update ###"

cd $parentdir/alyson

npm version ${NEW_BRANCH}

for REPO in "${repos2[@]}"; do
   echo $REPO
   cd $parentdir/$REPO
   git stash;git pull;git checkout ${NEW_BRANCH}
   git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}
done

cd $parentdir/genny-main
for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   echo $i
   cd $parentdir/$i
   git stash;git pull;git checkout ${NEW_BRANCH}
   mvn versions:set -DnewVersion=${NEW_VERSION}
   mvn versions:commit; mvn clean install
   git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}
done

cd $parentdir/genny-main

git add .; git commit -m "Upgrade to ${NEW_BRANCH}"; git push --set-upstream origin ${NEW_BRANCH}
