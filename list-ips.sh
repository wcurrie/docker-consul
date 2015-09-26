#!/bin/bash
. funcs.sh

for who in {srv,agent}
do
    for i in {1..3}
    do
        container=$who-$i
        ip=$(dip $container)
        echo $container $ip
        export $who$i=$ip
    done
done
