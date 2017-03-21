#!/bin/bash

  set -e

  if [ "$1" = run -a "$(id -u)" = '0' ]; then
    for path in \
      /opt/nifi/conf \
      /opt/nifi/database_repository \
      /opt/nifi/flowfile_repository \
      /opt/nifi/content_repository \
      /opt/nifi/provenance_repository \
    ; do
      chown -R nifi:nifi "$path"
    done

    set -- gosu nifi /opt/nifi/bin/nifi.sh "$@"
  fi

  exec "$@"
