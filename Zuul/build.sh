#!/bin/bash

mvn clean install

cp ./target/Zuul-0.0.1-SNAPSHOT.jar .
docker stop Zuul || true
docker rm Zuul || true
docker build -t zuul:latest .