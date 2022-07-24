#!/bin/bash

CONTAINER=mycontainer
IMAGE=j11s22k33/myimage
TAG=latest

docker rm \
	$CONTAINER \
	--force
docker run \
	--detach \
	--privileged \
	--interactive \
	--tty \
	--publish 3000:3000 \
	--name $CONTAINER \
	$IMAGE:$TAG

#exit

docker exec \
	--privileged \
	--interactive \
	--tty \
	%CONTAINER%
	/bin/bash