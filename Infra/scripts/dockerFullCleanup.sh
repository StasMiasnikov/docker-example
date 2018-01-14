#!/bin/bash

clear
echo "STOPPING ALL CONTAINERS"
docker stop $(docker ps  -q)
echo "REMOVING  ALL CONTAINERS"
docker rm -f $(docker ps -a -f status=exited -q)
echo "REMOVING  ALL IMAGES"
#docker rmi -f $(docker images -a -q)
echo "REMOVING  ALL DANGLING IMAGES"
docker rmi $(docker images -f dangling=true -q)
echo "REMOVING  ALL DANGLING VOLUMES"
docker volume ls -qf dangling=true | xargs -r docker volume rm
echo "RESTARTING DOCKER SERVICE"
service docker restart


