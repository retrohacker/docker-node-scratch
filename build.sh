#!/usr/bin/env bash

docker build -f ./Dockerfile.build -t nodesource/scratch:build .
sudo rm -rf output
docker run -it -v $PWD:/foobar nodesource/scratch:build mv output foobar/output
sudo chown -R wblankenship:wblankenship output
cp ./node-bootstrap ./output/node-bootstrap
docker build -t nodesource/nodejs:scratch -f Dockerfile.scratch .
echo "run: docker run -it nodesource/nodejs:scratch"
