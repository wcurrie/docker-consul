#!/bin/bash
. funcs

# start 3 servers
for i in {1..3}
do 
    docker run -d --name srv-$i gliderlabs/consul-server -bootstrap-expect 3 
    export srv$i=$(dip srv-1)
done

docker exec srv-2 consul join $srv1
docker exec srv-3 consul join $srv1

echo srv-{1..3} $srv{1..3}

# start 3 clients
for i in {1..3}
do 
    docker run -d --name agent-$i gliderlabs/consul-agent -retry-join $srv1
done
