#!/bin/bash

docker ps -a|grep consul-|awk '{ print $1 }'|xargs docker rm -f
