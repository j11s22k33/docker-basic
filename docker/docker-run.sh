#!/bin/bash

CONTAINER=mycontainer
IMAGE=j11s22k33/myimage

docker rm $CONTAINER --force

docker run \
	--detach \
	--privileged \
	--user root \
	--interactive \
	--tty \
	--publish 3000:3000 \
	--name $CONTAINER \
	$IMAGE