#!/bin/sh

LISTEN_ADDRESS=$1
JOIN=$2

docker swarm join --listen-addr $LISTEN_ADDRESS:2377 $JOIN:2377
