#!/bin/bash

docker exec $1 bash -c 'mongo -u replicaAdmin -p replicaAdminPassword2017 --authenticationDatabase "admin" < /data/admin/replica.js'
