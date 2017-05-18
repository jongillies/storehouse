#!/bin/bash

version=`semver`

docker build -t storehouse:$version .
docker build -t storehouse:latest .

#docker push registry.io/storehouse:$version
#docker push registry.io/storehouse:latest
