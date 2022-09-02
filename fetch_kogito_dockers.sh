#!/bin/bash
version=$1
docker pull quay.io/kiegroup/kogito-jobs-service-infinispan:${version}
docker pull quay.io/kiegroup/kogito-task-console:${version}
docker pull quay.io/kiegroup/kogito-management-console:${version}
docker pull quay.io/kiegroup/kogito-data-index-infinispan:${version}

