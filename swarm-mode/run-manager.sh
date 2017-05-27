#!/bin/bash

docker swarm init --advertise-addr enp0s8

JOIN_TOKEN=$(docker swarm join-token worker -q)

echo $JOIN_TOKEN > /vagrant/.token

