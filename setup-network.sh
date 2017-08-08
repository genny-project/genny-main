#!/bin/bash
docker network create -d overlay  --subnet 10.0.64.0/24 genny-network
