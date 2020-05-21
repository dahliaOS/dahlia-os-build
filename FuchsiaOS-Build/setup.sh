#!/bin/bash

# Define Fn and set os variable for repo refresh and dependency install
findOS(){
	cat /etc/os-release | sed -n 4p
}
os=$(findOS)

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
        echo -e "${bldred}   |    ${bldnormal}Self-installation of libraries     ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   | ${bldnormal}Downloading the code ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |   ${bldnormal}Configuring your computer  ${bldred}| "
        echo -e "${bldred}   ----------------------------  "

tput setaf 3
	sleep 1
	echo  
	echo Updating package list ...
	echo  
	sleep 3

tput setaf 2
if [ "$os" = 'ID_LIKE="opensuse suse"' ]
then
	time sudo zypper refresh

elif [ "$os" = 'ID_LIKE="rhel fedora"' ]
then
	time $(sudo dnf check-update --refresh)

else
	time sudo apt update
fi
tput setaf 3
	echo  
	echo Installing required packages ...
	echo  
	sleep 3
tput setaf 2
if  [ "$os" = 'ID_LIKE="opensuse suse"' ] ; then
	time sudo zypper -n install -t pattern devel_C_C++;
	time sudo zypper install texinfo glib2-devel autoconf libtool libsdl-dev build-essential go git curl unzip python-xml  
elif  [ "$os" = 'ID_LIKE="rhel fedora"' ] ; then
	time sudo dnf group install "C Development Tools and Libraries"; 
	time sudo dnf install texinfo glib2-devel autoconf libtool SDL2_image-devel go git curl unzip python-xmltramp
else
	        time sudo apt -y install texinfo libglib2.0-dev liblz4-tool autoconf libtool libsdl-dev build-essential golang git build-essential curl unzip
fi
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
	echo -e "${bldcya}To continue the code download run: ${bldred}./source.sh "
	echo  
	sleep 5
tput setaf 2
