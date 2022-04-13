#!/bin/bash
if [[ "$#" -lt 2 ]]; then
        echo "Usage: $0 <project name> <rule name>"
        echo "Case Sensitive"
	echo "Automatically scans prj_genny"
	exit 1
fi

echo "Looking in prj_genny for $2.bpmn"
find ../prj_genny -name "$2.bpmn"
echo "Looking in $1 for $2.bpmn"
find ../$1 -name "$2.bpmn"
