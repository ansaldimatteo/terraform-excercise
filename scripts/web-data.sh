#!/bin/bash
apt-get update -y
apt-get install docker.io -y
apt-get install docker-compose -y
git clone https://github.com/ansaldimatteo/simple-website.git
echo "const URL = '${app_url}'" > /simple-website/public-html/js/constants.js
cd simple-website/
docker-compose up -d
