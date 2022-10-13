#!/bin/bash
source ./docker_tags.env

docker pull quay.io/kiegroup/kogito-data-index-infinispan:${KOGITO_ECOSYSTEM_VERSION}
docker pull quay.io/kiegroup/kogito-management-console:${KOGITO_ECOSYSTEM_VERSION}
docker pull quay.io/kiegroup/kogito-jobs-service-infinispan:${KOGITO_ECOSYSTEM_VERSION}
docker pull quay.io/kiegroup/kogito-task-console:${KOGITO_ECOSYSTEM_VERSION}

