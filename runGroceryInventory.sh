#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Build
echo 'try to build new image of GroceryInventory'
cd GroceryInventory
./build.sh
cd ..

# # Clear and run database
# docker stop msdobot_mongo_grocery
# docker rm msdobot_mongo_grocery
# docker run --restart=always -d -p 9027:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_grocery mongo:3.6.15-xenial

# Run docker container
docker run --restart=always -d -p 10004:10004 -e "TZ=Asia/Taipei" --name GroceryInventory groceryinventory:latest