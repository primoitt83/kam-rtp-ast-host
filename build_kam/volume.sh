#!/bin/bash

mkdir -p kamailio
mkdir -p rtpengine

docker cp kamailio:/etc/kamailio/. ./kamailio/.
docker cp kamailio:/etc/rtpengine/. ./rtpengine/.

docker-compose down
cp docker-compose.yml docker-compose.yml.bkp
cp docker-compose.vol.yml docker-compose.yml
docker-compose up -d