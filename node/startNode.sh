#!/bin/bash

echo $TOTAL_NODE > /opt/TOTAL_NODE

for ((i=1; i<=$TOTAL_NODE; i++))
do
   CONTAINER_PORT=$((5554 + $i))
   echo $CONTAINER_PORT > /opt/$CONTAINER_PORT
   nohup phantomjs --webdriver=$DOCKER_IP:$CONTAINER_PORT --webdriver-selenium-grid-hub=http://$HUB_IP:4444 > /opt/node_$CONTAINER_PORT.log &
done

