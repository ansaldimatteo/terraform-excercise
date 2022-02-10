#!/bin/bash
apt-get update -y
apt-get install docker.io -y
apt-get install docker-compose -y
git clone https://github.com/ansaldimatteo/mysql-docker.git
cd mysql-docker/
docker-compose up -d