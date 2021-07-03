#!/bin/bash

echo "clear existed mongo-db of Cinema system"
docker stop msdobot_mongo_cinema
docker stop msdobot_mongo_grocery
docker stop msdobot_mongo_notification
docker stop msdobot_mongo_orderingList
docker rm msdobot_mongo_cinema
docker rm msdobot_mongo_grocery
docker rm msdobot_mongo_notification
docker rm msdobot_mongo_orderingList

# add up 50 in each port for testing
echo "run mongo-db for Cinema system"
docker run --restart=always -d -p 9078:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_cinema mongo:3.6.15-xenial
docker run --restart=always -d -p 9077:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_grocery mongo:3.6.15-xenial
docker run --restart=always -d -p 9076:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_notification mongo:3.6.15-xenial
docker run --restart=always -d -p 9075:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_orderingList mongo:3.6.15-xenial

docker run --restart=always -d -p 9089:9039 -e "TZ=Asia/Taipei" --name Zuul zuul:latest

sleep 20s

docker run --restart=always -d -p 9090:9040 -e "TZ=Asia/Taipei" --name EurekaServer eurekaserver:latest

echo "Waiting For Eureka Server..."
sleep 30s

docker run --restart=always -d -p 9066:9016 -e "TZ=Asia/Taipei" --name Payment payment:latest
docker run --restart=always -d -p 9062:9012 -e "TZ=Asia/Taipei" --name Notification notification:latest

sleep 30s

docker run --restart=always -d -p 9065:9015 -e "TZ=Asia/Taipei" --name Ordering ordering:latest

sleep 30s

docker run --restart=always -d -p 9063:9013 -e "TZ=Asia/Taipei" --name GroceryInventory groceryinventory:latest
docker run --restart=always -d -p 9064:9014 -e "TZ=Asia/Taipei" --name CinemaCatalog cinemacatalog:latest
docker run --restart=always -d -p 9067:9017 -e "TZ=Asia/Taipei" --name Cinema cinema:latest