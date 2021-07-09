#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

mvn clean test package -Dmaven.test.failure.ignore=true
mvn install -Dmaven.test.skip=true

echo 'show current pwd'
echo $(pwd)
echo 'try to show current content'
echo $(ls)
cp ./target/groceryinventory-0.0.1-SNAPSHOT.jar .
docker stop GroceryInventory || true
docker rm GroceryInventory || true
docker build -t groceryinventory:latest .