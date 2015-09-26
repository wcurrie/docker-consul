
function dip { 
    docker inspect -f '{{ .NetworkSettings.IPAddress }}' $1
}

function dexec {
    container=$1
    shift
    if [ $# -eq 0 ]
    then
        cmd=sh
    else
        cmd="$@"
    fi

    docker exec -it $container $cmd
}

function dm-iptables {
    docker-machine ssh default "sudo /usr/local/sbin/iptables $@"
}

function start-client {
    name=agent-$1
    docker run --detach --name $name --hostname $name gliderlabs/consul-agent -retry-join $srv1
}

