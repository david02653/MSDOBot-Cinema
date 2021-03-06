#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

## Build
cd EurekaServer
./build.sh
cd ..

# Clear and run database
# Run docker container
docker run --restart=always -d -p 10001:10001 -e "TZ=Asia/Taipei" --name EurekaServer eurekaserver:latest