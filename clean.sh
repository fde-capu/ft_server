#"/bin/bash

docker container rm -f $(docker ps -aq)
docker rmi $(docker images -aq)
