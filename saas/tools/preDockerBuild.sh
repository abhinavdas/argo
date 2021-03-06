#!/bin/bash

base_registry=${ARGO_BASE_REGISTRY:-docker.io}
dev_registry=${ARGO_DEV_REGISTRY}

cat BaseDockerfile | sed "s#%%ARGO_BASE_REGISTRY%%#${base_registry}#g" | docker build -t ${dev_registry}/kafka-base:v1.4 -
docker push ${dev_registry}/kafka-base:v1.4

cat KafkaTestDockerfile | sed "s#%%ARGO_BASE_REGISTRY%%#${base_registry}#g" | docker build -t ${dev_registry}/kafka-dev:v1.4 -
docker push ${dev_registry}/kafka-dev:v1.4
