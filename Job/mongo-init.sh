#!/bin/bash -e
# Create mongo db collections

cat <<EOF >/etc/yum.repos.d/mongodb-org-6.0.repo
[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc
EOF

yum install -y mongodb-mongosh

cat <<EOF >dbscript.js
show databases
use newdb
db.createCollection("myColl")
db.myColl.createIndex({altID: 1})
show databases
show collections
db.myColl.getIndexes();
EOF
mongosh "mongodb://192.168.1.17:27017" --username mongoadmin --password secret < dbscript.js