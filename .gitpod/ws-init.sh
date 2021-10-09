#!/bin/bash

DOCKER_PSQL_NAME=postgres

set -a
source ~/.bash_profile
source .gitpod/.env

# QEMU-K3S init
source /opt/qemu-k3s/ws-init.sh
set +a

ln -fs .gitpod/.env ~/.env
echo "source ~/.env" > ~/.bashrc

# Install Argo WF (one-time)
.gitpod/install-argo-wf.sh

# Run postgresql
echo "Running PostgreSQL in a Docker container"
[[ $(docker ps -f "name=$DOCKER_PSQL_NAME" --format '{{.Names}}') == $DOCKER_PSQL_NAME ]] || docker run --name "$DOCKER_PSQL_NAME" -e POSTGRES_USER=$PGUSER -e POSTGRES_PASSWORD=$PGPASSWORD -d -p 5432:5432 --restart=always postgres
echo "✅ PSQL setup complete. Use 'psql' and other utilities normally."
