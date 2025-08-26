#!/bin/bash

IP=${1:?}

curl -s "http://${IP}:9200/_cat/shards?s=node&v"
