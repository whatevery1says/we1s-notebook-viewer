#!/usr/bin/env bash

mkdir -p html

docker build -t we1s-notebook-viewer .

docker run --name we1s-notebook-viewer -p 10001:80 -v html:/usr/share/nginx/html:ro -d nginx
