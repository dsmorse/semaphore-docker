#!/usr/bin/env bash

# If this is the first time we have run this container, update place holder to env vars in config files
if [ -e /firstrun ]; then
  echo "Starting first run actions"
  sed -i s/MYSQL_IP_ADDR/${MYSQL_PORT_3306_TCP_ADDR}/ /opt/data/semaphore/semaphore_config.*
  semaphore -setup  <  /opt/data/semaphore/semaphore_config.stdin
  # Remove first run so that subsequent runs within the same container instance don't invoke first_run logic again
  rm /firstrun
fi


#start the container
 semaphore -config /opt/data/semaphore/semaphore_config.json;