#!/bin/bash

# Comando para iniciar o MongoDB como replicaset
MONGOGOD_PID=$!

INIT_REPL_CMD="rs.initiate({_id: 'rs0', members: [{_id:0, host: '$MONGO_REPLICA_HOST:$MONGO_REPLICA_PORT'}]});"
INIT_USER_CMD="db.getSiblingDB('admin').getUser('$MONGO_INITDB_ROOT_USERNAME') || db.getSiblingDB('admin').createUser({user: '$MONGO_INITDB_ROOT_USERNAME', pwd: '$MONGO_INITDB_ROOT_PASSWORD', roles: [{role: 'root', db: 'admin'}]});"

# Aguarde o MongoDB iniciar
until mongosh --port $MONGO_REPLICA_PORT --eval "$INIT_REPL_CMD" 2>&1 | grep -q "MongoServerError: already initialized"; do
  echo "REPLICA SET ONLINE"
  mongosh --port $MONGO_REPLICA_PORT --eval "$INIT_REPL_CMD"
  sleep 5
done

mongosh --port $MONGO_REPLICA_PORT --eval "$INIT_USER_CMD"
wait $MONGOGOD_PID
