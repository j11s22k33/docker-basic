#!/bin/bash

DOCKER_FILE=./Dockerfile
IMAGE=j11s22k33/myimage
BUILD_BASE_DIR=../

docker build \
  --file $DOCKER_FILE \
  --tag $IMAGE \
  $BUILD_BASE_DIR
