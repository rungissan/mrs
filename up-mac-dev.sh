#!/usr/bin/env bash

export UID
export GID
docker-compose -p mrs -f  docker-compose.yml  up $@

