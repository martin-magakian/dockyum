#!/bin/bash

for ((i=1; i<=$TOTAL_NODE; i++))
do
   CONTAINER_PORT=$((5554 + $i))
   nohup phantomjs --webdriver=$DOCKER_IP:$CONTAINER_PORT --webdriver-selenium-grid-hub=http://$GRID_IP:4444 > /opt/node_$i.log &
done

exit 0

