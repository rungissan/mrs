#!/usr/bin/env bash

export UID
export GID
docker-compose -p test -f  docker-compose.yml  up $@

