#!/bin/bash

# Initialisation color

# Lien 1 : https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
# Lien 2 : https://misc.flogisoft.com/bash/tip_colors_and_formatting
cH1='\033[0;93m'
cH2='\033[0;94m'
cP='\033[0;90m'
cNOCOLOR='\033[0m' # No Color

# Create the network
printf "${cH1}Creating the network tpDock ... \n"
printf "${cP}"
docker network create tpDock
printf "${cNOCOLOR}"

## Base de donnée Postgres: tpDockBDD
printf "${cH1}Creating the container tpDockBDD ...\n"
printf "${cP}"
docker run -d \
	--name tpdockbdd \
	--network tpDock \
	-p 27017:27017 \
	-e MONGO_INITDB_DATABASE="tpdock" \
	mongo:3.6.20-xenial

#docker exec -it tpDockBDD mongo systemctl status mongodb
docker logs tpdockbdd
printf "${cNOCOLOR}"

# Generate the project with Dockerfile
printf "${cH1}Generate the project with Dockerfile ... \n"
printf "${cP}"
docker build --tag tp-dock:1.0 .
printf "${cNOCOLOR}"

# Serveur Script Node : tpDockSCRIPT
printf "${cH1}Creating the container tpDockSCRIPT ... \n"
printf "${cP}"
docker run --name tpDockSCRIPT -p 5000:5000 -d --network tpDock tp-dock:1.0
docker exec -i tpDockSCRIPT bash -c "cd ./app && node server.js"
docker logs tpDockSCRIPT
printf "${cNOCOLOR}"

# Serveur HTTP : tpDockHTTP
printf "${cH1}Creating the container tpDockHTTP ...\n"
printf "${cP}"
docker container run --name tpDockHTTP -d -p 8080:80 -v "$(pwd)/default.conf:/etc/nginx/conf.d/default.conf" --network tpDock nginx:1.19
printf "${cNOCOLOR}"

printf "${cH2}End of the installation \n"