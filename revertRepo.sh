#!/bin/bash
if [ "$#" -lt 3 ]; then
	echo "Usage: $0 <repo> <ver> <date-time> [auto-commit]"
	echo "auto-commit: true/false"
	exit 1
fi
repo=$1
ver=$2
dt=$3
ac="false"
if [ "$#" -eq 4 ]; then
	ac=$4
fi

if [ ! -d "../$repo" ]; then
	echo "No such repo cloned!: $repo"
	echo "Options: `ls ../`"
	exit 1
fi

cd ../$repo
safecommit=`git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
if [ -z $safecommit ]; then
	echo "Could not find decent commit to revert to at time ${dt} in repo: ${repo}:${ver}"
	exit 1
fi
commitmsg="Reverting $repo:$ver to last commit from HEAD at ${dt}. Hash: $safecommit"

echo $commitmsg
git revert -n "$safecommit^..HEAD"
if [ "$ac" = "true" ]; then
	echo "auto committing with message: $commitmsg"
	git commit -m "$commitmsg"
	git push
fi
