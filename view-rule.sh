#!/bin/bash
if [[ "$#" -lt 2 ]]; then
        echo "Usage: $0 <project name> <rule name>"
        echo "Case Sensitive"
	echo "Automatically scans prj_genny"
fi

echo "Looking in prj_genny for $2.drl"
find ../prj_genny -name "$2.drl"
echo "Looking in $1 for $2.drl"
cat `find ../$1 -name "$2.drl"`
