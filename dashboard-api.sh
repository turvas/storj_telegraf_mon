#!/bin/bash
#
# Get SNO data folder size.
#
# Usage:
# ./bandwith.sh resolvanel hostname or IP (except localhost, 127.0.0.1)
#
# Output:
# StorJHealth,host=K3,path="/path/to/storagenode/data/folder" directory_size_kilobytes=45816232

HOST=$1
NODE=$(curl -s $HOST:14002/api/dashboard | jq .data.nodeID)
GB=$((1024*1024*1024))
BW=$(curl -s $HOST:14002/api/dashboard | jq .data.bandwidth.used)
DISK=$(curl -s $HOST:14002/api/dashboard | jq .data.diskSpace.used)
BWGB=$(($BW/$GB))
DISKGB=$(($DISK/$GB))
echo -n StorJHealth,host=$HOSTNAME,NodeId=$NODE bandwith_used_gb=$BWGB,disk_used_gb=$DISKGB "$(date +'%s%N')"
