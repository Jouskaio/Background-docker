#!/bin/bash

docker network create tpDock

docker container run -d --rm --name tpDockSCRIPT --hostname tpDockSCRIPT --network tpDock -v $(pwd)/monsite:/var/www/tpDock node:latest

docker container run -d --rm --name tpDockHTTP --hostname tpDockHTTP --network tpDock -v $(pwd)/monsite:/var/www/tpDock -v $(pwd)/default.conf:/etc/nginx/conf.d/default.conf -p 8080:80 httpd:latest