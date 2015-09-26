
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

function start-client {
    name=agent-$1
    docker run --detach --name $name --hostname $name gliderlabs/consul-agent -retry-join $srv1
}

function list-consulates {
    docker ps -a|grep consul-|awk '{ print $1 }'
}

# causing trouble with iptables

function dm-iptables {
    docker-machine ssh default "sudo /usr/local/sbin/iptables $@"
}

function dm-block {
    echo "blocking $1 <-> $2"
    dm-iptables "-A $(mk-block-rule $1 $2)"
    dm-iptables "-A $(mk-block-rule $2 $1)"
}

function dm-unblock {
    echo "unblocking $1 <-> $2"
    dm-iptables "-D $(mk-block-rule $1 $2)"
    dm-iptables "-D $(mk-block-rule $2 $1)"
}

function mk-block-rule {
    echo "DOCKER -s $1 -d $2 -j DROP"
}
