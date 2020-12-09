#!/bin/bash 

mongodb1=`getent hosts ${MONGOS} | awk '{ print $1 }'`

port=${PORT:-27010}

echo "Waiting for startup.."
until mongo --host 172.19.0.4 --port 27010 --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done

echo "Started.."

echo level1.sh time now: `date +"%T" `
mongo --host 172.19.0.4 --port 27010 <<EOF
   show dbs;
   use qeng;
   db.test.find().pretty();
EOF