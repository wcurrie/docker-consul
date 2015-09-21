# Consul in Docker

Looking for what used to be `progrium/consul`? Look in the `legacy` branch.

# Tyre Kicking

Can surely be improved.

* From docker-consul/0.5/consul
* Start a server
    docker run -h server-one -v $(pwd)/web-ui:/web-ui -t gliderlabs/consul /bin/consul agent -server -bootstrap-expect=1 -data-dir /tmp/consul -config-dir /etc/consud -ui-dir /web-ui -client 0.0.0.0
* Start a client
    docker run -h agent-one -t gliderlabs/consul /bin/consul agent -data-dir /tmp/consul -config-dir /etc/consul.d
* Make client join the server's cluster. 
    docker exec -it <agent-container> consul join <server-ip-address>

## License

MIT

<img src="https://ga-beacon.appspot.com/UA-58928488-2/docker-consul/readme?pixel" />
