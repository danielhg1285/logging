#!/usr/bin/env bash

# install-kibana.sh
# This script install EFK stack used for visualizing logs via web
# This script depends on apache2-utils ubuntu package for http authentication

wait_if_error_and_tty() {
  if [[ -t 0 || -t 1 ]] ;
  then
      echo press any key to continue
	  read;
  else
	  true;
  fi
}

./generate-kibana-auth.sh

NETWORK="kibana-net_external"
docker network create $NETWORK > /dev/null 2>&1

# Start services
docker-compose up -d || wait_if_error_and_tty