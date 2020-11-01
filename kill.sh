#!/bin/bash

# Initialisation color

# Lien 1 : https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
# Lien 2 : https://misc.flogisoft.com/bash/tip_colors_and_formatting
cH1='\033[0;93m'
cH2='\033[0;94m'
cP='\033[0;90m'
cNOCOLOR='\033[0m' # No Color



printf "${cH1}Removing container tpDockHTTP ... \n"
printf "${cP}"
docker stop tpDockHTTP
docker container rm tpDockHTTP
printf "${cNOCOLOR}"

printf "${cH1}Removing container tpDockBDD ... \n"
printf "${cP}"
docker stop tpdockbdd
docker container rm tpdockbdd
printf "${cNOCOLOR}"

printf "${cH1}Removing container tpDockSCRIPT ... \n"
printf "${cP}"
docker stop tpDockSCRIPT
docker container rm tpDockSCRIPT
printf "${cNOCOLOR}"

printf "${cH1}Removing network tpDock ... \n"
printf "${cP}"
docker network rm tpDock
printf "${cNOCOLOR}"