#!/usr/bin/bash
echo "clean previous version"
rm -rf ./bin
echo "Building code"
docker build --rm -t local/output:latest .

echo "Getting binaries"
docker run --name out -dt local/output:latest sh
docker cp out:/output/release/ ./bin/

echo "Cleaning containers"
docker stop out
docker rm out