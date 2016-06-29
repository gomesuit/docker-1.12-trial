#!/bin/sh

LISTEN_ADDRESS=$1

docker swarm init --listen-addr $LISTEN_ADDRESS:2377
