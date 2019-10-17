#!/bin/bash
#
# Get SNO data storage and network stats.
#
# Usage:
# ./dashboard-api.sh [hostname or IP] (except localhost, 127.0.0.1)
#
# Output:
# StorJHealth,host=6c9b1ae9d64b,NodeId="19d9PNywYK9XWmvbDa7rHFhiUMnm7EkVFCtkWZuCXd4Pjjb8JG" bandwith_used_gb=270,disk_used_gb=282 1571337062870579000

HOST=$1
NODE=$(curl -s $HOST:14002/api/dashboard | jq .data.nodeID)
GB=$((1024*1024*1024))
BW=$(curl -s $HOST:14002/api/dashboard | jq .data.bandwidth.used)
DISK=$(curl -s $HOST:14002/api/dashboard | jq .data.diskSpace.used)
BWGB=$(($BW/$GB))
DISKGB=$(($DISK/$GB))
CONTAINER=$(docker ps -q -f name=storagenode)
echo -n StorJHealth,host=$CONTAINER,NodeId=$NODE bandwith_used_gb=$BWGB,disk_used_gb=$DISKGB "$(date +'%s%N')"
