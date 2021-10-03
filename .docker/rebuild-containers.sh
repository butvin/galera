#!/usr/bin/env bash
#shellcheck disable=SC2046
docker stop $(docker ps -q -a); \
docker rm $(docker ps -qa); \
sudo rm -rf .docker/.dbdata; \

make \
    --debug=basic \
    --warn-undefined-variables \
    --trace \
;

