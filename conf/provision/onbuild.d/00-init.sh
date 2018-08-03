source /opt/docker/bin/functions.sh

mkdir -p $ELASTIC_PATH_DATA
mkdir -p $ELASTIC_PATH_LOGS

chown -R $ELASTIC_USER.$ELASTIC_GROUP $ELASTIC_PATH_DATA
chown -R $ELASTIC_USER.$ELASTIC_GROUP $ELASTIC_PATH_LOGS

copyFileTo "/opt/docker/etc/elasticsearch/config/elasticsearch.yml" "${ELASTIC_INSTALL}/config/elasticsearch.yml"

if [ ! -d "/opt/docker/.cache/elasticsearch" ];then
    mkdir -p /opt/docker/.cache/elasticsearch
    # Backup
    cp ${ELASTIC_INSTALL}/config/*.yml /opt/docker/.cache/elasticsearch
    cp /opt/docker/etc/supervisor.d/*.conf /opt/docker/.cache/elasticsearch
    cp -f /opt/docker/.cache/elasticsearch/*.conf /opt/docker/etc/supervisor.d/
else
    cp -f /opt/docker/.cache/elasticsearch/*.yml ${ELASTIC_INSTALL}/config/
fi

# Replace markers
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_NAME>"       "$ELASTIC_NAME"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_NODE>"       "$ELASTIC_NODE"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_PATH_DATA>"  "$ELASTIC_PATH_DATA"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_PATH_LOGS>"  "$ELASTIC_PATH_LOGS"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_HOST>"       "$ELASTIC_HOST"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_PORT>"       "$ELASTIC_PORT"

find /opt/docker/etc/supervisor.d/ -iname '*.conf' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_USER>" "$ELASTIC_USER"
