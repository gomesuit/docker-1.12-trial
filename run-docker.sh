#!/bin/sh

#curl -fsSL https://test.docker.com/ | sh
curl -fsSL https://get.docker.com/ | sh

systemctl enable docker
systemctl start docker
