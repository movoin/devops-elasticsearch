#
# Docker Image      movoin/devops-elasticsearch
#
# MAINTAINER        Allen Luo <movoin@gmail.com>
# DOCKER-VERSION    1.12.3
#

FROM        movoin/devops-java
MAINTAINER  Allen Luo <movoin@gmail.com>

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

COPY conf/ /opt/docker/

RUN set -x \
    # Install
    && /opt/docker/bin/install.sh \
    # Bootstrap
    && /opt/docker/bin/bootstrap.sh \
    # Clean
    && yum clean all \
    && rm -rf /var/cache/yum

EXPOSE $ELASTIC_PORT
