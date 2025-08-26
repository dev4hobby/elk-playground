#!/bin/bash

IP=${1:?}

curl -XPUT -H 'Content-Type: application/json' -T <(cat <<EOF
{
  "persistent": {
    "cluster.routing.allocation.exclude._ip": "$IP"
  }
}
EOF
) $IP:9200/_cluster/settings
