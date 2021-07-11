#!/bin/bash
# this script will try to stop and remove all cinema related mongodb
# note that this version will combin all 4 mongodb into 1

# stop container and remove
echo 'stop and remove all container with prefix name of "msdobot_mongo_"'
echo 'stop:'
docker stop $(docker ps -a -f "name=msdobot_mongo_" --format "{{.Names}}")
echo 'rm:'
docker rm $(docker ps -a -f "name=msdobot_mongo_" --format "{{.Names}}")

# run container again
echo 'try to run mongo container again'
echo 'run mongo:'
#docker run --restart=always -d -p 9028:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_cinema mongo:3.6.15-xenial
#docker run --restart=always -d -p 9027:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_grocery mongo:3.6.15-xenial
#docker run --restart=always -d -p 9026:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_notification mongo:3.6.15-xenial
#docker run --restart=always -d -p 9025:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_orderingList mongo:3.6.15-xenial
docker run --restart=always -d -p 10009:27017 -e "TZ=Asia/Taipei" --name msdobot_mongo_cinema_system mongo:3.6.15-xenial
