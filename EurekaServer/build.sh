#!/bin/bash

$JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

mvn clean install

cp ./target/EurekaServer-0.0.1-SNAPSHOT.jar .
docker stop EurekaServer || true
docker rm EurekaServer || true
docker build -t eurekaserver:latest .