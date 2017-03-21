#!/bin/bash

  set -e

  if [ "${1:0:1}" = '-' ]; then
    set -- /opt/elasticsearch/bin/elasticsearch "$@"
  fi

  if [ "$1" = /opt/elasticsearch/bin/elasticsearch -a "$(id -u)" = '0' ]; then
    for path in \
      /opt/elasticsearch/data \
      /opt/elasticsearch/config \
    ; do
      chown -R elasticsearch:elasticsearch "$path"
    done

    set -- gosu elasticsearch "$@"
  fi
  exec "$@"

