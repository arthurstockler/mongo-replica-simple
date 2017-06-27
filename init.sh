#!/bin/bash

sudo rm -rf data/
sudo rm -f keyfile/mongo-keyfile

echo ">> Criando no primario"
sleep 2

docker run --name mongoNode1 \
-v `pwd`/data/primary:/data/db  \
-v `pwd`/admin:/data/admin  \
-d mongo --smallfiles

echo ">> Aplicando criacao de usuario"
sleep 2
docker exec mongoNode1 bash -c 'mongo < /data/admin/admin.js'

echo ">> Mudando dono da pasta para mongo"
sleep 2
docker exec mongoNode1 bash -c 'chown -R mongodb:mongodb /data'

echo ">> Removendo os docker"
sleep 5
docker stop mongoNode1 && docker rm mongoNode1

echo ">> Criando chave ssl"
sleep 2
openssl rand -base64 741 > mongo-keyfile && chmod 600 mongo-keyfile && sudo chown 999 mongo-keyfile
mv mongo-keyfile keyfile/mongo-keyfile


echo ">> Iniciando docker-compose"
sleep 5
docker-compose up -d

#sleep 20
#echo ">> Iniciando replica..."
#docker exec mongo_mongo-primary_1 bash -c 'mongo -u replicaAdmin -p replicaAdminPassword2017 --authenticationDatabase "admin" < /data/admin/replica.js'
