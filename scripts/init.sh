#!/bin/bash

git clean -fdX
cp -r volumes-templates volumes



PW_STARTER=$(docker run --rm alpine/openssl:3.3.3 rand -base64 64)

PW1=$(echo $PW_STARTER | cut -c 1-10 | tr -d '\n')
PW2=$(echo $PW_STARTER | cut -c 33-64 | tr -d '\n')


echo "MYSQL_ROOT_PASSWORD='$PW1'" > ./mysql.env
echo "MYSQL_DATABASE='php-app'" > ./php-and-mysql.env
echo "MYSQL_USER='php-agent'" >> ./php-and-mysql.env
echo "MYSQL_PASSWORD='$PW2'" >> ./php-and-mysql.env
echo "MYSQL_TCP_PORT='3311'" >> ./php-and-mysql.env
echo "MYSQL_HOST='db-svc'" >> ./php-and-mysql.env
echo "TZ='America/Kentucky/Louisville'" >> ./php-and-mysql.env
