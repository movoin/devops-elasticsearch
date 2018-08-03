source /opt/docker/bin/functions.sh

# Create app group
groupadd -g $ELASTIC_GID $ELASTIC_GROUP

# Create app user
useradd -g $ELASTIC_GID -u $ELASTIC_UID $ELASTIC_USER
