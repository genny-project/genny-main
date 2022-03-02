#!/bin/bash
kcat -b kafka:9092 -C -o beginning -q -t $1
