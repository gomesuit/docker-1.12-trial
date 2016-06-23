#!/bin/sh

JOIN=$1

docker swarm join $JOIN:2377
