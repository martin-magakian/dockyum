dockynium = Docker with Selenium
=========

Run the selenium grid:
```bash
dockyum.sh start-grid 
```

Run 3 selenium nodes:
```bash
dockyum.sh start-node 3
```

Run 15 selenium nodes to remote grid:
```bash
dockyum.sh start-node 15 192.168.1.222
```

Run without dockyum.sh
---
Run the selenium grid:
```bash
docker run -d -p 4444:4444 doduck/seleniumGrid
```

Run 3 selenium nodes to remote grid:
```bash
docker run -d -e GRID_IP=172.16.254.131 -e DOCKER_IP=172.16.254.131 -e TOTAL_NODE=3  -p 2222:22 -p 5555:5555 -p 5556:5556 -p 5557:5557 doduck/seleniumNodes
```
* GRID_IP ip of the Selenium grid
* DOCKER_IP ip of the computer where your running the command from
* TOTAL_NODE number of node to start
* Be carefull to the port redirection !
If you start 3 nodes you need to export 3 port starting from port 5555<br />
see: -p 5555:5555 -p 5556:5556 -p 5557:5557

Stop the grid
----
No tools provided for this task (feel free to contribute)
Stop all Docker containers
```bash
docker stop $(docker ps -a -q)
```

(Optional) Build your own image
----
Docker build the selenium hub:
```bash
docker build -t doduck/seleniumGrid ./seleniumGrid
```

Docker build the selenium nodes:
```bash
docker build -t doduck/seleniumNodes ./seleniumNodes
```
