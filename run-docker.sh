#!/bin/sh

curl -fsSL https://test.docker.com/ | sh

systemctl enable docker
systemctl start docker
