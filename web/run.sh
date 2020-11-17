#!/bin/sh

docker rm -f web
docker run --name web -d -v $(pwd)/web/:/usr/share/nginx/html -p 8181:80 nginx:1-alpine