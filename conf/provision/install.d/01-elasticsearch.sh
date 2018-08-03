source /opt/docker/bin/functions.sh

cd /tmp

wget "$ELASTIC_URL"
tar zxf elasticsearch-"$ELASTIC_VERSION".tar.gz
mv /tmp/elasticsearch-"$ELASTIC_VERSION" $ELASTIC_INSTALL

chown -R $ELASTIC_USER.$ELASTIC_GROUP $ELASTIC_INSTALL

rm -rf /tmp/elasticsearch-"$ELASTIC_VERSION".tar.gz
