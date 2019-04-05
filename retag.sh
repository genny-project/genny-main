#!/bin/bash
if [ -z "${1}" ]; then
  echo "usage: ./gitretag.sh <version>"
  exit;
else
 tag=$1
 echo "retagging "
fi
#1. list all remote tags
git ls-remote --tags

#2. delete local tag
git tag -d $tag 

#3. push tag deletion to remote
git push origin :refs/tags/${tag}

#4. tag local branch again
git tag ${tag} 

#5. push tag to remote
git push origin tag ${tag} 

