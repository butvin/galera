#!/usr/bin/env sh
set -eux;

# shellcheck disable=SC2046
docker stop $(docker ps -q -a); \
# shellcheck disable=SC2046
docker rm $(docker ps -qa); \
sudo rm -rf .docker/.dbdata; \
make \
    --debug=basic \
    --warn-undefined-variables \
    --trace \
;

