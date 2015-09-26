#!/bin/bash
. funcs.sh

for id in $(list-consulates)
do
    name=$(docker inspect -f '{{.Name}}' $id | sed 's/^\///')
    ip=$(dip $id)
    echo $name $ip
    export ${name/-/}=$ip
done
