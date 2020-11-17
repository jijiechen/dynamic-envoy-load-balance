#!/bin/bash


./web/run.sh
docker rm -f dynamic-envoy
docker run --name dynamic-envoy -d -v $(pwd)/:/etc/envoy/ -p 80:80 envoyproxy/envoy-alpine:v1.16-latest -l debug -c /etc/envoy/envoy.yaml
docker logs -f dynamic-envoy