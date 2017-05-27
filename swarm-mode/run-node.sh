#!/bin/bash

if [ $# -ne 1 ]; then
  echo "usage : $0 [manager ip]"
  exit 1
fi

MANAGER_IP=$1

JOIN_TOKEN=$(cat /vagrant/.token)

docker swarm join --token ${JOIN_TOKEN} ${MANAGER_IP}:2377

