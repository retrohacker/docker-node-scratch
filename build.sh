#!/usr/bin/env bash

docker build -f ./Dockerfile.build -t retrohacker/nodejs:build .
sudo rm -rf output
docker run -it -v $PWD:/foobar retrohacker/nodejs:build mv output foobar/output
sudo chown -R wblankenship:wblankenship output
cp ./bootstrap ./output/bootstrap
docker build -t retrohacker/nodejs:mini -f Dockerfile.scratch .
echo "run: docker run -it nodesource/nodejs:scratch"
