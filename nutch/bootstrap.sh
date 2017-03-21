#!/bin/bash

  set -e 

  if [ "$1" == webapp -a "$(id -u)" = '0' ]; then
    for path in \
      /opt/nutch/conf \
    ; do
      chown -R nutch:nutch "$path"
    done
    set 
    set -- gosu nutch /opt/nutch/bin/nutch webapp "$@"
  fi

  exec "$@"
export JAVA_HOME=/usr

/opt/nutch/bin/nutch startserver &

