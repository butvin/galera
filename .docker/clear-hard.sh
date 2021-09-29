#!/usr/bin/env bash
#shellcheck disable=SC2046
docker stop $(docker ps -q -a); \
docker rm -fvl $(docker ps -qa); \
## !!! Drop all pulled images !!!
#docker rmi --force $(docker images -qa); \
docker volume rm -f $(docker volume ls -q); \
docker network rm $(docker network ls -q); \
docker system prune -af; \
sudo rm -rf .docker/.dbdata/*; \

make -d \
    --warn-undefined-variables \
    --trace \
;

