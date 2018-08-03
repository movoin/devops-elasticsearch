#!/usr/bin/env bash

source /opt/docker/bin/functions.sh

includeScriptDir "/opt/docker/bin/service.d/elasticsearch.d"

exec $ELASTIC_INSTALL/bin/elasticsearch
