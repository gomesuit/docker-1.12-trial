#!/bin/bash

vagrant ssh manager -c 'docker swarm init --advertise-addr enp0s8'

JOIN_TOKEN=$(vagrant ssh manager -c 'docker swarm join-token worker -q' | sed '$s/.$//')

vagrant ssh node1 -c "docker swarm join --token $JOIN_TOKEN 192.168.33.10:2377"
vagrant ssh node2 -c "docker swarm join --token $JOIN_TOKEN 192.168.33.10:2377"

