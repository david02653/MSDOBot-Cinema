#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

## Build
cd CinemaCatalog
./build.sh
cd ..

# Clear and run database
# Run docker container
docker run --restart=always -d -p 9064:9014 -e "TZ=Asia/Taipei" --name CinemaCatalog cinemacatalog:latest