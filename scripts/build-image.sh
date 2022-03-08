#!/bin/zsh

docker rmi -f hocgin/docker-ssr:0.0.2
docker build . -t hocgin/docker-ssr:0.0.2

docker rm test
docker run -it \
 -v /Users/hocgin/Downloads/iii/app/public:/usr/web/app/public \
 -v /Users/hocgin/Downloads/iii/app/public/manifest.json:/usr/web/config/manifest.json \
 -p 7001:7001 \
 --name test \
 hocgin/docker-ssr:0.0.2



