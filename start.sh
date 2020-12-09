#!/bin/bash 
echo "Waiting for starting all servers..."

docker-compose -f docker-router.yml -f docker-shardsvr.yml -f docker-configsvr.cnf.yml up