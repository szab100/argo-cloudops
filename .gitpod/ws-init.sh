#!/bin/sh

DOCKER_PSQL_NAME=postgres

# QEMU-K3S init
source /opt/qemu-k3s/ws-init.sh

# Install Argo WF (one-time)
.gitpod/install-argo-wf.sh

# Run postgresql
echo "Running PostgreSQL in a Docker container"
export PGHOST=127.0.0.1
export PGPORT=5432
export PGUSER=root
export PGPASSWORD=1234
[[ $(docker ps -f "name=$DOCKER_PSQL_NAME" --format '{{.Names}}') == $DOCKER_PSQL_NAME ]] || docker run --name "$DOCKER_PSQL_NAME" -e POSTGRES_USER=$PGUSER -e POSTGRES_PASSWORD=$PGPASSWORD -d -p 5432:5432 --restart=always postgres
echo "✅ PSQL setup complete. Use 'psql' and other utilities normally."
