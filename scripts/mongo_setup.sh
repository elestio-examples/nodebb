#!/bin/bash
echo "sleeping for 20 seconds"
sleep 20

echo mongo_setup.sh time now: `date +"%T" `
mongosh --host mongo:27017 <<EOF
  var cfg = {
    "_id": "Cluster0",
    "version": 1,
    "members": [
      {
        "_id": 0,
        "host": "INSTANCE_DOMAIN:17271",
        "priority": 2
      }
    ]
  };
  rs.initiate(cfg);

  use admin
  db.createUser( { user: "admin", pwd: "SOFTWARE_PASSWORD", passwordDigestor:"server",
  roles: [ { role: "clusterAdmin", db: "admin" }, { role: 'backup', db: 'admin' }, { role: "readWriteAnyDatabase", db: "admin" }, "readWrite"] }, { w: "majority" , wtimeout: 5000 } )
EOF