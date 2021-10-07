#!/usr/bin/env sh
# shellcheck disable=SC2046
docker stop $(docker ps -q -a); \
# shellcheck disable=SC2046
docker rm $(docker ps -qa); \
sudo rm -rf ./.dbdata; \
make \
    --debug=basic \
    --warn-undefined-variables \
    --trace;

