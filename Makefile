MAKEFLAGS += --silent

DOCKER_REPO="movoin/devops-elasticsearch"

all: elasticsearch

publish: push

#
# image: movoin/devops-elasticsearch
#
elasticsearch:
	bash build.sh "${DOCKER_REPO}"

test:
	docker run -it --rm  -p 9200:9200 ${DOCKER_REPO}

run:
	docker run -it --rm ${DOCKER_REPO} bash

push:
	docker push ${DOCKER_REPO}
