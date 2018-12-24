#!/usr/bin/env bash

###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/provision.sh"

runInit "elasticsearch.d"

exec $ELASTIC_INSTALL/bin/elasticsearch
