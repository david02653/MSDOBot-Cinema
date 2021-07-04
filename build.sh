#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

## Build
cd Zuul
./build.sh
cd ..

cd EurekaServer
./build.sh
cd ..

cd Payment
./build.sh
cd ..

cd Notification
./build.sh
cd ..

cd Ordering
./build.sh
cd ..

cd CinemaCatalog
./build.sh
cd ..

cd GroceryInventory
./build.sh
cd ..

cd Cinema
./build.sh
cd ..
