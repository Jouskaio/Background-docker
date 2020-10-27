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

# Generate the project with Dockerfile
printf "${cH1}Generate the project with Dockerfile ... \n"
printf "${cP}"
docker build --tag tp-dock:1.0 .
printf "${cNOCOLOR}"

# Serveur Script Node : tpDockSCRIPT
printf "${cH1}Creating the container tpDockSCRIPT ... \n"
printf "${cP}"
	# -w est utilisé pour rendre la destination modifiable
docker run --name tpDockSCRIPT -p 5000:5000 -d --network tpDock tp-dock:1.0
printf "${cNOCOLOR}"
docker logs -f tpDockSCRIPT
printf "${cNOCOLOR}"

# Serveur HTTP : tpDockHTTP
printf "${cH1}Creating the container tpDockHTTP ...\n"
printf "${cP}"
docker container run --name tpDockHTTP -d -p 8080:80 -v "$(pwd)/default.conf:/etc/nginx/conf.d/default.conf" --network tpDock nginx:1.19
printf "${cNOCOLOR}"
## Base de donnée Postgres: tpDockBDD
printf "${cH1}Creating the container tpDockBDD ...\n"
printf "${cP}"
docker run -d --name tpDockBDD --network tpDock mongo-express:latest
printf "${cNOCOLOR}"

read -p 'Installing Vim and Ping ? : y/n ' response
if [ $response = "y" ]; then
	printf "${cH1}Updating apt-get ... \n"
	printf "${cP}"
	docker exec tpDockHTTP apt-get update
	printf "${cNOCOLOR}"
	
	printf "${cH1}Installing Vim ... \n"
	printf "${cP}"
	docker exec tpDockHTTP apt-get --assume-yes install vim
	printf "${cNOCOLOR}"
	
		# Tools used to test if tpDockBDD is detected in tpDockHTTP
	printf "${cH1}Installing Ping ... \n"
	printf "${cP}"
	docker exec tpDockHTTP apt-get --assume-yes install iputils-ping
	printf "${cNOCOLOR}"
	
	# Install curl
	printf "${cH1}Installing Curl ... \n"
	printf "${cP}"
	docker exec tpDockHTTP apt-get --assume-yes install curl
	printf "${cNOCOLOR}"
	printf "${cH2}Vim, Curl and Ping are installed \n"
else
	echo "${cH2}Plugins will be not downloaded \n"
fi
	printf "${cH2}End of the installation \n"