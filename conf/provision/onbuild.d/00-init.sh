###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

mkdir -p $ELASTIC_PATH_DATA
mkdir -p $ELASTIC_PATH_LOGS

chown -R $ELASTIC_USER.$ELASTIC_GROUP $ELASTIC_PATH_DATA
chown -R $ELASTIC_USER.$ELASTIC_GROUP $ELASTIC_PATH_LOGS

copyFileTo "$DOCKER_CONF_PATH/etc/elasticsearch/config/elasticsearch.yml" "${ELASTIC_INSTALL}/config/elasticsearch.yml"

# Replace markers
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_NAME>"       "$ELASTIC_NAME"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_NODE>"       "$ELASTIC_NODE"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_PATH_DATA>"  "$ELASTIC_PATH_DATA"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_PATH_LOGS>"  "$ELASTIC_PATH_LOGS"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_HOST>"       "$ELASTIC_HOST"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_PORT>"       "$ELASTIC_PORT"
find "${ELASTIC_INSTALL}/config" -iname '*.yml' -print0 | xargs -0 -r docker-replace --quiet "<DOCKER_CONF_PATH>"   "$DOCKER_CONF_PATH"

find /opt/docker/etc/supervisor.d/ -iname '*.conf' -print0 | xargs -0 -r docker-replace --quiet "<ELASTIC_USER>"    "$ELASTIC_USER"
