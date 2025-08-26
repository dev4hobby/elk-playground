#!/bin/bash

IP=${1:?}
curl -s "http://${IP}:9200/_cluster/health?pretty" | jq -r .status
