#!/bin/bash
jps -l | grep $1 | cut -d" " -f1 | xargs kill -9

