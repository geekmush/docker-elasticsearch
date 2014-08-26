#! /bin/bash

function add_es_master {
cat >>/elasticsearch/config/elasticsearch.yml <<EEOF

cluster:
  name: ${ES_CLUSTERNAME}
discovery:
  zen:
    ping:
      unicast: ${ES1_PORT_9300_TCP_ADDR}
EEOF
}

if [ ! -z "${ES1_PORT_9300_TCP_ADDR}" ] ; then
  add_es_master
fi

echo "............"
echo "Using config file:"
cat /elasticsearch/config/elasticsearch.yml
echo "............"

/elasticsearch/bin/elasticsearch
