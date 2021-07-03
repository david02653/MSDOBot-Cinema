#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

mvn clean install

cp ./target/Zuul-0.0.1-SNAPSHOT.jar .
docker stop Zuul || true
docker rm Zuul || true
docker build -t zuul:latest .