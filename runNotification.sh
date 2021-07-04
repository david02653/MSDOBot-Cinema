#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Build
cd Notification
./build.sh
cd ..

# Clear and run database
docker stop msdobot_mongo_notification
docker rm msdobot_mongo_notification
docker run --restart=always -d -p 9076:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_notification mongo:3.6.15-xenial

# Run docker container
docker run --restart=always -d -p 9062:9012 -e "TZ=Asia/Taipei" --name Notification notification:latest