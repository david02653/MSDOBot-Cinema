#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Build
cd Payment
./build.sh
cd ..

# Run docker container
docker run --restart=always -d -p 10007:9016 -e "TZ=Asia/Taipei" --name Payment payment:latest
