#!/bin/bash

echo "Aguardando MongoDB iniciar..."

sleep 10

echo "Configurando o Replica Set..."
mongosh --port $MONGO_REPLICA_PORT --eval "rs.initiate({_id: 'rs0', members: [{ _id: 0, host: '$MONGO_REPLICA_HOST:$MONGO_REPLICA_PORT' }]});"
