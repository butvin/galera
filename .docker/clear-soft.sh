#!/usr/bin/env bash
# shellcheck disable=SC2046
docker stop $(docker ps -q -a); \
docker rm -f -l -v $(docker ps -q -a); \
docker volume rm -f $(docker volume ls -q); \
docker network rm $(docker network ls -q); \
sudo rm -rf .docker/.dbdata; \
make  --warn-undefined-variables -d --trace;