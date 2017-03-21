#!/bin/bash

  set -e

  if [ "$1" = start -a "$(id -u)" = '0' ]; then
    for path in \
      /opt/solr/conf \
      /opt/solr/data \
    ; do
      chown -R solr:solr "$path"
    done

    set -- gosu solr /opt/solr/bin/solr "$@"
  fi

  exec "$@"
	  
