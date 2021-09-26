#!/usr/bin/env bash

# shellcheck disable=SC2046
docker stop --time=4 $(docker ps -q -a); \
docker rm -f -l -v $(docker ps -q -a); \
#docker rmi --force $(docker images -qa); \
#docker volume rm -f $(docker volume ls -q); \
#docker network rm $(docker network ls -q); \
#docker system prune -af; \
#sudo rm -rf .docker/.dbdata; \
make  --warn-undefined-variables -d --trace;