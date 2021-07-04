#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Build
cd Cinema
./build.sh
cd ..

# Clear and run database
docker stop msdobot_mongo_cinema
docker rm msdobot_mongo_cinema
docker run --restart=always -d -p 9078:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_cinema mongo:3.6.15-xenial

# Run docker container
docker run --restart=always -d -p 9067:9017 -e "TZ=Asia/Taipei" --name Cinema cinema:latest