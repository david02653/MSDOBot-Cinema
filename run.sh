#!/bin/bash

echo "clear existed mongo-db of Cinema system"
docker stop mongo_cinema
docker stop mongo_grocery
docker stop mongo_notification
docker stop mongo_orderingList
docker rm mongo_cinema
docker rm mongo_grocery
docker rm mongo_notification
docker rm mongo_orderingList

echo "run mongo-db for Cinema system"
docker run --restart=always -d -p 9028:27017 -e "TZ=Asia/Taipei" --name mongo_cinema mongo:3.6.15-xenial
docker run --restart=always -d -p 9027:27017 -e "TZ=Asia/Taipei" --name mongo_grocery mongo:3.6.15-xenial
docker run --restart=always -d -p 9026:27017 -e "TZ=Asia/Taipei" --name mongo_grocery mongo:3.6.15-xenial
docker run --restart=always -d -p 9025:27017 -e "TZ=Asia/Taipei" --name mongo_grocery mongo:3.6.15-xenial

docker run --restart=always -d -p 9039:9039 -e "TZ=Asia/Taipei" --name Zuul zuul:latest

sleep 20s

docker run --restart=always -d -p 9040:9040 -e "TZ=Asia/Taipei" --name EurekaServer eurekaserver:latest

echo "Waiting For Eureka Server..."
sleep 30s

docker run --restart=always -d -p 9016:9016 -e "TZ=Asia/Taipei" --name Payment payment:latest
docker run --restart=always -d -p 9012:9012 -e "TZ=Asia/Taipei" --name Notification notification:latest

sleep 30s

docker run --restart=always -d -p 9015:9015 -e "TZ=Asia/Taipei" --name Ordering ordering:latest

sleep 30s

docker run --restart=always -d -p 9013:9013 -e "TZ=Asia/Taipei" --name GroceryInventory groceryinventory:latest
docker run --restart=always -d -p 9014:9014 -e "TZ=Asia/Taipei" --name CinemaCatalog cinemacatalog:latest
docker run --restart=always -d -p 9017:9017 -e "TZ=Asia/Taipei" --name Cinema cinema:latest