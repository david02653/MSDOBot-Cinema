#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

## Build
cd Zuul
./build.sh
cd ..

# Clear and run database
# Run docker container
docker run --restart=always -d -p 10002:9039 -e "TZ=Asia/Taipei" --name Zuul zuul:latest