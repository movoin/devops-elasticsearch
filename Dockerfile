#
# Docker Image      movoin/devops-elasticsearch
#
# MAINTAINER        Allen Luo <movoin@gmail.com>
# DOCKER-VERSION    18.09.0
#

FROM movoin/devops-java

ENV ELASTIC_VERSION     6.3.2
ENV ELASTIC_URL         "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTIC_VERSION}.tar.gz"
ENV ELASTIC_INSTALL     /usr/local/elasticsearch

ENV ELASTIC_USER        elastic
ENV ELASTIC_GROUP       elastic
ENV ELASTIC_UID         2000
ENV ELASTIC_GID         2000

ENV ELASTIC_NAME        elastic
ENV ELASTIC_NODE        node-1
ENV ELASTIC_PATH_DATA   /opt/data/elastic
ENV ELASTIC_PATH_LOGS   /opt/logs/elastic
ENV ELASTIC_HOST        0.0.0.0
ENV ELASTIC_PORT        9200

COPY conf/ $DOCKER_CONF_PATH

RUN set -x \
    # Bootstrap
    && $DOCKER_CONF_PATH/bin/bootstrap.sh

EXPOSE $ELASTIC_PORT
