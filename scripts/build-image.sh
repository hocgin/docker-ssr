#!/bin/zsh

docker rmi -f hocgin/docker-ssr:0.0.2
docker build . -t hocgin/docker-ssr:0.0.2

docker rm test
docker run -it \
 -v /Users/hocgin/Projects/antd-starter/dist:/usr/web/app/public \
 -v /Users/hocgin/Projects/antd-starter/dist/manifest.json:/usr/web/config/manifest.json \
 -p 7001:7001 \
 --name test \
 --add-host=host.docker.internal:192.168.1.2 \
 hocgin/docker-ssr:0.0.2



