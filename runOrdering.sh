#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Build
cd Ordering
./build.sh
cd ..

# # Clear and run database
# docker stop msdobot_mongo_orderingList
# docker rm msdobot_mongo_orderingList
# docker run --restart=always -d -p 9025:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_orderingList mongo:3.6.15-xenial

# Run docker container
docker run --restart=always -d -p 10006:10006 -e "TZ=Asia/Taipei" --name Ordering ordering:latest