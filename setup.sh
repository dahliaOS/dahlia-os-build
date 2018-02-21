#!/bin/bash
# Specify colors utilized in the terminal
normal='tput sgr0'              # White
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
blue='tput setaf 4'             # Blue
violet='tput setaf 5'           # Violet
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold Red
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldblu=${txtbld}$(tput setaf 4) # Bold Blue
bldylw=$(txtbld)$(tput setaf 3) # Bold Yellow
bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
bldwht=${txtbld}$(tput setaf 7) # Bold White

clear

        echo -e "${bldred}                                 "
        echo -e "${bldred}   ----------------------------- "
        echo -e "${bldred}   |    ${bldnormal}Autoinstalacion de librerias     ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   | ${bldnormal}Descargando el codigo ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |   ${bldnormal}Configurando su computadora  ${bldred}| "
        echo -e "${bldred}   ----------------------------  "

tput setaf 3
	sleep 1
	echo  
	echo Updating package list ...
	echo  
	sleep 3
tput setaf 2
	time sudo apt-get update
tput setaf 3
	echo  
	echo Installing required packages ...
	echo  
	sleep 3
tput setaf 2
	time sudo apt-get -y install texinfo libglib2.0-dev liblz4-tool autoconf libtool libsdl-dev build-essential golang git build-essential curl unzip
tput setaf 3
	echo  
	echo Installing and configuring ccache
	echo 
tput setaf 2 	
	git clone https://github.com/ccache/ccache.git -b master
	cd ccache
	./autogen.sh
	./configure
	make
	sudo cp -v ./ccache /usr/bin/ccache
	echo "export USE_CCACHE=1" >> ${HOME}/.bashrc
	echo  
tput setaf 3
	echo  
	echo -e "${bldcya}Para continuar la descarga de codigo ejecute: ${bldred}./source.sh "
	echo  
	sleep 5
tput setaf 2
