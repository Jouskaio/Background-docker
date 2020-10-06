#!/bin/bash

docker network create tpDock

docker container run -d --rm --name tpDockHTTP --hostname script --network tpDock -v $(pwd)/monsite:/var/www/monsite httpd:latest

docker container run -d --rm --name tpDockSCRIPT --hostname tpDockSCRIPT --network tpDock -v $(pwd)/monsite:/var/www/monsite -v $(pwd)/default.conf:/etc/nginx/conf.d/default.conf -p 8080:80 php:7.4-cli
