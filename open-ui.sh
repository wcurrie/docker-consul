#!/bin/bash

http_port=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8500/tcp") 0).HostPort}}' srv-1)
url=$(echo $DOCKER_HOST | sed -e 's/tcp:/http:/' -e "s/:[0-9][0-9]*/:$http_port/")

open $url
