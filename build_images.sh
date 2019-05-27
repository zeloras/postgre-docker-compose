#!/bin/bash
export $(grep -v '^#' ${PWD}/.env | xargs)

COLOR_NORMAL='\033[0m'
COLOR_RED='\033[0;31m'
COLOR_BLUE='\033[0;32m'
COLOR_YELLOW='\033[1;34m'

# Start swarm
echo -e "${COLOR_BLUE}Start postrgresql-docker docker-swarm${COLOR_NORMAL}"
envsubst < docker-swarm.yml > docker-swarm-local.yml;
docker stack deploy -c docker-swarm-local.yml --with-registry-auth postrgresql-docker

echo -e "${COLOR_BLUE}Start remove old image${COLOR_NORMAL}"
docker system prune -f
