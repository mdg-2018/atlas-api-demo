#!/bin/bash
. ./env.config

curl --user "${PUBLICKEY}:${PRIVATEKEY}" --digest \
--header "Content-Type: application/json" \
--include \
--request POST "https://cloud.mongodb.com/api/atlas/v1.0/groups/${GROUPID}/clusters?pretty=true" \
--data '
     {
  "autoScaling": {
    "compute": {
      "enabled": false,
      "scaleDownEnabled": false
    },
    "diskGBEnabled": true
  },
  "backupEnabled": false,
  "biConnector": {
    "enabled": false,
    "readPreference": "secondary"
  },
  "clusterType": "REPLICASET",
  "diskSizeGB": 10,
  "encryptionAtRestProvider": "NONE",
  "groupId": "5c5c92a1a6f23944d0d7d452",
  "labels": [],
  "mongoDBMajorVersion": "4.2",
  "mongoDBVersion": "4.2.2",
  "name": "privateLinkTest-backup-target",
  "numShards": 1,
  "paused": false,
  "pitEnabled": false,
  "providerBackupEnabled": true,
  "providerSettings": {
    "providerName": "AWS",
    "autoScaling": {
      "compute": {
        "maxInstanceSize": null,
        "minInstanceSize": null
      }
    },
    "diskIOPS": 100,
    "encryptEBSVolume": true,
    "instanceSizeName": "M10",
    "volumeType": "STANDARD"
  },
  "replicationSpec": {
    "US_EAST_2": {
      "analyticsNodes": 0,
      "electableNodes": 1,
      "priority": 7,
      "readOnlyNodes": 0
    },
    "US_EAST_1": {
      "analyticsNodes": 0,
      "electableNodes": 1,
      "priority": 6,
      "readOnlyNodes": 0
    },
    "US_WEST_1": {
      "analyticsNodes": 0,
      "electableNodes": 1,
      "priority": 5,
      "readOnlyNodes": 0
    }
  }
}'
