#!/usr/local/bin/dumb-init /bin/bash

source /opt/qnib/consul/etc/bash_functions.sh
wait_for_srv consul-http

consul-template -consul localhost:8500 -once -template "/etc/consul-templates/neo4j/neo4j.conf.ctmpl:/opt/neo4j/conf/neo4j.conf"
/opt/neo4j/bin/neo4j console
