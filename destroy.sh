#!/bin/bash

docker-compose down

sudo rm -rf data/
sudo rm -f keyfile/mongo-keyfile
sudo docker rm mongoNode1
