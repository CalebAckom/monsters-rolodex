#!/bin/bash
echo "Deploying"
DOCKER_IMAGE=calebackom/monsters-rolodex
docker pull $DOCKER_IMAGE
docker ps -q --filter ancestor=$DOCKER_IMAGE | xargs -r docker stop
docker run -d -p 3000:3000 $DOCKER_IMAGE
