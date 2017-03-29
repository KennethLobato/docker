#!/bin/bash

  set -e 

  if [ "$1" == webapp -a "$(id -u)" = '0' ]; then
    for path in \
      /opt/nutch/conf \
    ; do
      chown -R nutch:nutch "$path"
    done
 
    set -- gosu nutch bash -c "export JAVA_HOME=/usr \
           && bin/nutch webapp" "$@"
  fi

  if [ "$1" == standalone -a "$(id -u)" = '0' ]; then
    for path in \
      /opt/nutch/conf \
    ; do
      chown -R nutch:nutch "$path"
    done

    set -- gosu nutch bash -c "export JAVA_HOME=/usr \
	   && bin/nutch startserver & \
	   export JAVA_HOME=/usr \
	   && bin/nutch webapp" "$@"
  fi

  if [ "$1" == startserver -a "$(id -u)" = '0' ]; then
    for path in \
      /opt/nutch/conf \
    ; do
      chown -R nutch:nutch "$path"
    done

    set -- gosu nutch bash -c "export JAVA_HOME=/usr \
	   && bin/nutch startserver" "$@"
  fi

  exec "$@"

