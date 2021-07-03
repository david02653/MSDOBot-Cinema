#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

## Build
cd Zuul
bash ./build.sh
cd ..

cd EurekaServer
bash ./build.sh
cd 

cd Payment
bash ./build.sh
cd ..

cd Notification
bash ./build.sh
cd ..

cd Ordering
bash ./build.sh
cd ..

cd CinemaCatalog
bash ./build.sh
cd ..

cd GroceryInventory
bash ./build.sh
cd ..

cd Cinema
bash ./build.sh
cd ..