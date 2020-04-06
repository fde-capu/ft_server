#!/bin/bash
docker container rm -f $(docker ps -aq) 
docker rmi $(docker images -aq)
docker images --no-trunc --format '{{.ID}}'
