#!/bin/sh

ROOT_DIR=$(dirname $(readlink -f $0))/..
DOCKER_COMPOSE_DEV_FILE_PATH=$ROOT_DIR/docker-compose.dev.yaml

docker compose -f $DOCKER_COMPOSE_DEV_FILE_PATH down --volumes --remove-orphans