#!/usr/bin/env sh
#shellcheck disable=SC2046
docker stop $(docker ps -q -a); \
docker rm  $(docker ps -qa); \
docker network rm $(docker network ls -q); \
sudo rm -rf .docker/.dbdata; \
make;