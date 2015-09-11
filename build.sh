#!/bin/bash

version=`semver`

docker build -t registry.skytouch.io/storehouse:$version .
docker build -t registry.skytouch.io/storehouse:latest .

docker push registry.skytouch.io/storehouse:$version
docker push registry.skytouch.io/storehouse:latest
