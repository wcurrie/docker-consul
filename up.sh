#!/bin/bash
. funcs

# start 3 servers
for i in {1..3}
do 
    docker run --detach --publish-all --name srv-$i --hostname srv-$i gliderlabs/consul-server -bootstrap-expect 3 
    ip=$(dip srv-$i)
    export srv$i=$ip
    echo srv-$i $ip
done

docker exec srv-2 consul join $srv1
docker exec srv-3 consul join $srv1


# start 3 clients
for i in {1..3}
do 
    docker run --detach --name agent-$i --hostname agent-$i gliderlabs/consul-agent -retry-join $srv1
done
