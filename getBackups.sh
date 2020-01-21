#!/bin/bash
. ./env.config

CLUSTER=YourClusterNameHere

curl --user "${PUBLICKEY}:${PRIVATEKEY}" --digest --include \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  --request GET "https://cloud.mongodb.com/api/atlas/v1.0/groups/${GROUPID}/clusters/${CLUSTER}/backup/snapshots"