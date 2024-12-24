FROM mongo:8.0.3

ENV MONGO_REPLICA_PORT=27017
ENV MONGO_REPLICA_HOST=localhost

# Copia o script de inicialização
COPY init-replica.sh /docker-entrypoint-initdb.d/init-replica.sh

# Força o uso do Bash e corrige permissões
RUN chmod +x /docker-entrypoint-initdb.d/init-replica.sh && \
    sed -i '1s|^|#!/bin/bash\n|' /docker-entrypoint-initdb.d/init-replica.sh
