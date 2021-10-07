#!/usr/bin/env bash
# shellcheck disable=SC2046
docker stop $(docker ps -q -a); \
docker rm -fvl $(docker ps -qa); \
docker rmi -f $(docker images -qa); \
docker volume rm -f $(docker volume ls -q); \
docker network rm $(docker network ls -q); \
docker system prune -af; \
sudo rm -rf .docker/.dbdata/*; \
make \
    --debug=all \
    --warn-undefined-variables \
    --trace \
;
