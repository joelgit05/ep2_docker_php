#!/bin/bash

docker network create devnet

docker run -d \
  --name mariadb \
  --network devnet \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=test \
  mariadb

docker run -d \
  --name php_server \
  --network devnet \
  -p 8080:80 \
  joelgit05/ep2_php_image

docker run -d \
  --name cloud9 \
  --network devnet \
  -p 8081:8080 \
  codercom/code-server
