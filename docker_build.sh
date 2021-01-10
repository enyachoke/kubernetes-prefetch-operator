#!/bin/bash
echo fine
make build
service=kubernetes-prefetch-operator
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
echo "Building and Pushing $service $TRAVIS_CPU_ARCH image"
make docker-build docker-push IMG=$DOCKER_USERNAME/${service}:$(git rev-parse --short HEAD)_$TRAVIS_CPU_ARCH
