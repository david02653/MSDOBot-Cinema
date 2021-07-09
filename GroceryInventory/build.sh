#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

mvn clean test package -Dmaven.test.failure.ignore=true
mvn install -Dmaven.test.skip=true

echo 'show current pwd'
echo $(pwd)
echo 'try to show current content'
echo $(ls)
echo 'try to show content in target folder'
cd target
echo $(ls)
cd ..
cp ./target/groceryinventory-1.jar .
docker stop GroceryInventory || true
docker rm GroceryInventory || true
docker build -t groceryinventory:latest .