#!/bin/bash 

mongodb1="172.19.0.4"

port=${PORT:-27017}

echo "Waiting for startup.."
echo ${mongodb1}
until mongo --host ${mongodb1} --port ${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done

echo "Started.."

echo level1.sh time now: `date +"%T" `
mongo --host 172.19.0.4 --port 27017 <<EOF
   show dbs;
   use qeng;
   db.test.find().pretty();
EOF