# docker-mongo-services

# Description

This is a simple 3 node mongodb setup based on official mongo docker image using docker-compose described.

configsvr
shardsvr
mongos(router)

# Run

# First

```
docker-compose -f docker-configsvr.cnf.yml up
```

# Second

```
docker-compose -f docker-shardsvr.yml up
```

# Third

```
docker-compose -f docker-router.yml up
```

# OR

```
run start.sh
```
