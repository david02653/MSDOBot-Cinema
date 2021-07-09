#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

mvn clean test package -Dmaven.test.failure.ignore=true
mvn install -Dmaven.test.skip=true

cp ./target/groceryinventory-0.0.1-SNAPSHOT.jar .
echo $(ll)
docker stop GroceryInventory || true
docker rm GroceryInventory || true
docker build -t groceryinventory:latest .