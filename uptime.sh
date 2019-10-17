#!/bin/bash
#
# Get SNO uptime.
#
# Usage:
# ./bandwith.sh resolvanel hostname or IP (except localhost, 127.0.0.1)
#
# Output:
# StorJHealth,host=ed01b7ea2277 uptime_hr=24.17 1571336393951727200

if [ $# -gt 0 ]; then
	CONTAINERNAME=$1
else
	CONTAINERNAME=storagenode
fi
HOST=$(docker ps -q -f name=$CONTAINERNAME)
if [ -z "$HOST" ]; then
	echo Error: Container $1 not found, exiting..
	exit 1
fi
START=$(docker inspect $CONTAINERNAME --format='{{.State.StartedAt}}')
STARTSEC=$(date -d $START +%s)
NOWSEC=$(date +%s)
#in hours x 100
DIFF1=$(( (NOWSEC - STARTSEC) / 36 ))
# fake float math
DIFF=$(echo $DIFF1 | sed 's/..$/.&/')
echo -n StorJHealth,host=$HOST uptime_hr=$DIFF "$(date +'%s%N')"
