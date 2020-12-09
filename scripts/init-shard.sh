#!/bin/bash 

mongodb1=`getent hosts ${MONGOS} | awk '{ print $1 }'`

mongodb11=`getent hosts ${MONGO1} | awk '{ print $1 }'`

port=${PORT:-27010}

echo "Waiting for startup.."
until mongo --host ${mongodb1}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done

echo "Started.."

echo init-shard.sh time now: `date +"%T" `
mongo --host ${mongodb1}:${port} <<EOF
   sh.addShard( "${RS1}/${mongodb11}:${PORT}" );
   sh.status();
EOF
