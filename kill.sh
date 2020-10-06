#!/bin/bash

docker stop tpDockHTTP
docker stop tpDockSCRIPT

docker rm tpDockHTTP
docker rm tpDockSCRIPT

docker network rm tpDock