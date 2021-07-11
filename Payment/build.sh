#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

mvn clean test package -Dmaven.test.failure.ignore=true
mvn install -Dmaven.test.skip=true

#cp ./target/payment-0.0.1-SNAPSHOT.jar .
cp ./target/payment-1.jar .
docker stop Payment || true
docker rm Payment || true
docker build -t payment:latest .