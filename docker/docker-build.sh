#!/bin/bash

DOCKER_FILE=./Dockerfile
IMAGE=j11s22k33/myimage
TAG=latest
BUILD_BASE_DIR=../

docker build \
  --file $DOCKER_FILE \
  --tag $IMAGE:$TAG \
  $BUILD_BASE_DIR
