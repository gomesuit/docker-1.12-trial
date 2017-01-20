#!/bin/bash

vagrant ssh manager -c 'docker swarm init --advertise-addr enp0s8'

JOIN_TOKEN=$(vagrant ssh manager -c 'docker swarm join-token worker -q' | sed '$s/.$//')

vagrant ssh node01 -c "docker swarm join --token $JOIN_TOKEN manager:2377"
vagrant ssh node02 -c "docker swarm join --token $JOIN_TOKEN manager:2377"

