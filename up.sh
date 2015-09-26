#!/bin/bash
. funcs.sh

# start 3 servers
for i in {1..3}
do 
    docker run --detach --publish=8500 --name srv-$i --hostname srv-$i gliderlabs/consul-server -bootstrap-expect 3 
    ip=$(dip srv-$i)
    export srv$i=$ip
done

docker exec srv-2 consul join $srv1
docker exec srv-3 consul join $srv1

# start 3 clients
for i in {1..3}
do 
    start-client $i
done

./list-ips.sh
./open-ui.sh
