#!/bin/sh

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
docker run --name postgres -e POSTGRES_USER=$PGUSER -e POSTGRES_PASSWORD=$PGPASSWORD -d -p 5432:5432 postgres
echo "✅ PSQL setup complete. Use 'psql' and other utilities normally."
