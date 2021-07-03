#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

mvn clean install

cp ./target/cinema-1.jar .
docker stop Cinema || true
docker rm Cinema || true
docker build -t cinema:latest .