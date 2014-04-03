dockynium = Docker with Selenium
=========


Run the selenium hub:
docker run -p 4444:4444 -d --name selenium_hub doduck/seleniumHub

Run the selenium nodes (3 nodes):
DOCKER_IP=$(ip addr show dev eth0 | grep "inet " | awk '{print $2}' | cut -d '/' -f 1)
docker run -e "HUB_IP=172.16.254.131" -e "DOCKER_IP=$DOCKER_IP" -e "TOTAL_NODE=3" -p 2222:22 -p 5555:5555 -p 5556:5556 -p 5557:5557 -d doduck/seleniumNodes


(Optional)
----
Docker build the selenium hub:
docker build -t doduck/seleniumHub ./hub

Docker build the selenium nodes:
docker build -t doduck/seleniumNodes ./node
