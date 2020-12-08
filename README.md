# docker-mongo-services

# Description

This is a simple 3 node mongodb setup based on official mongo docker image using docker-compose described.

configsvr
shardsvr
mongos

# Run

# First

```
docker-compose -f docker-compose.cnf.yml
```

# Second

```
docker-compose -f docker-compose.1.yml up
```

# Third

```
docker-compose -f up docker-compose.shard.yml up
```
