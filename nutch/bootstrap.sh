#!/bin/bash
export JAVA_HOME=/usr

/opt/nutch/bin/nutch startserver &
/opt/nutch/bin/nutch webapp &

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi
