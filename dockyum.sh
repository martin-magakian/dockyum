#!/bin/bash

LOCAL_IP=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')

function startnode() {
	TOTAL_NODE=3
	if [[ -n "$2" ]] ; then
		TOTAL_NODE=$2
	fi

	#docker host
	DOCKER_IP=$LOCAL_IP
	if [[ -z "$DOCKER_IP" ]] ; then
		echo $* 1>&2
		echo "Something went wrong. Can't find IP on eth0" >&2
		echo "Exit now..." >&2
		exit 1
	fi

	#hub ip
	GRID_IP=$DOCKER_IP
	if [[ -n "$3" ]] ; then
		GRID_IP=$3
		echo "set GRID_IP=$GRID_IP"
	fi

	#conteneur param
	CONTENEUR_PORT_REDIRECT=" -p 2222:22"
	for ((i=1; i<=$TOTAL_NODE; i++))
	do
		CONTENEUR_PORT_REDIRECT=$CONTENEUR_PORT_REDIRECT" -p $((5554 + $i)):$((5554 + $i))"
	done
	echo "ocker run -d -e "GRID_IP=$GRID_IP" -e "DOCKER_IP=$DOCKER_IP" -e "TOTAL_NODE=$TOTAL_NODE" $CONTENEUR_PORT_REDIRECT doduck/seleniumNodes"
	#docker run -d -e "GRID_IP=$GRID_IP" -e "DOCKER_IP=$DOCKER_IP" -e "TOTAL_NODE=$TOTAL_NODE" $CONTENEUR_PORT_REDIRECT doduck/seleniumNodes
}

function startgrid() {
	#docker run -d -p 4444:4444 doduck/seleniumGrid
	echo "docker run -d -p 4444:4444 doduck/seleniumGrid"
	echo "grid running on:"
	echo "http://$LOCAL_IP:4444/grid/console"
}

function usage() {
	echo "Usage:    `basename $0` <action>"
	echo
	echo "ex:       `basename $0` start-grid"
	echo "          `basename $0` start-node 3 192.168.0.10"
	echo
	echo "Actions:  start-grid                      start the selenium grid"
	echo "          start-node                      start '3' nodes and register to localhost selenium grip"
	echo "          start-node <number>             start 'x' nodes and register to localhost selenium grip"
	echo "          start-node <number> <grip-ip>   start 'x' nodes and register to a specific selenium grip"
	echo ""
}


case $1 in
	start-grid)
		startgrid $*;;
	start-node)
		startnode $*;;
	*)
		usage
		exit 1
	;;

esac

