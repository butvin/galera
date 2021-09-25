#!/usr/bin/env bash

# shellcheck disable=SC2046
docker stop $(docker ps -q -a); \
docker rm -v $(docker ps -q -a); \
#docker rmi $(docker images -qa); \
docker volume rm -f $(docker volume ls -q); \
docker network rm $(docker network ls -q); \
#docker system prune -af; \
sudo rm -rf .docker/.dbdata/*; \
printf "Cleaned up..."; \
make  --warn-undefined-variables -d --trace;

