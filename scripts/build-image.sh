#!/bin/zsh

docker build . -t hocgin/ssr:v0.0.1
# docker run -it -p 7001:7001  -v /usr/web/app/public:/Users/hocgin/Downloads/iii/app/public -v /usr/web/app/config/manifest.json:/Users/hocgin/Downloads/iii/app/public/manifest.json --name test hocgin/ssr:v0.0.1