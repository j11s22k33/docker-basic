#!/bin/bash

CONTAINER=mycontainer
IMAGE=j11s22k33/myimage
TAG=latest

docker rm $CONTAINER --force
docker run \
  --detach \
  --publish 8080:8080 \
  --publish 3000:3000 \
  --publish 443:443 \
  --publish 80:80 \
  --name $CONTAINER \
  $IMAGE:$TAG
