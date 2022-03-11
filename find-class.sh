#!/bin/bash
if [[ "$#" -eq 0 ]]; then
	echo "Usage: ./find-class.sh <class name>"
	echo "Case Sensitive"
fi
cd ../
grep -r "public class $1"
