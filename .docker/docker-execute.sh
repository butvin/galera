#!/usr/bin/env sh
set -e; \
  docker stop $(docker ps -q -a) && docker rm $(docker ps -q -a) && \
  docker rmi -f $(docker images -qa) && \
  docker volume rm $(docker volume ls -q) && \
  docker network rm $(docker network ls -q) && \
  docker system prune -a -f \
; \


sudo rm -rf .docker/.dbdata;

echo "Docker cleanup done!"
# shellcheck disable=SC2046
#docker stop $(docker ps -q -a) && docker rm $(docker ps -q -a);
