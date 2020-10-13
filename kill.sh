#!/bin/bash

# Initialisation color

# Lien 1 : https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
# Lien 2 : https://misc.flogisoft.com/bash/tip_colors_and_formatting
cH1='\033[0;93m'
cH2='\033[0;94m'
cP='\033[0;90m'
cNOCOLOR='\033[0m' # No Color



printf "${cH1}Stopping container tpDockHTTP ... \n"
printf "${cP}"
docker stop tpDockHTTP
printf "${cNOCOLOR}"

printf "${cH1}Stopping container tpDockBDD ... \n"
printf "${cP}"
docker stop tpDockBDD
printf "${cNOCOLOR}"

printf "${cH1}Removing container tpDockSCRIPT ... \n"
printf "${cP}"
docker stop tpDockSCRIPT
printf "${cNOCOLOR}"

printf "${cH1}Removing container tpDockBDD ... \n"
printf "${cP}"
docker container rm tpDockBDD
printf "${cNOCOLOR}"


printf "${cH1}Removing network tpDock ... \n"
printf "${cP}"
docker network rm tpDock
printf "${cNOCOLOR}"