#!/bin/bash
# Specify colors utilized in the terminal
normal='tput sgr0'              # Normal
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
orange='tput setaf 166'         # Orange
blue='tput setaf 4'             # Blue
violet='tput setaf 5'           # Violet
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold Red
bldnormal=${txtbld}$(tput sgr0) # Bold normal
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldblu=${txtbld}$(tput setaf 4) # Bold Blue
bldylw=$(txtbld)$(tput setaf 3) # Bold Yellow
bldorange=$(txtbld)$(tput setaf 166) # Bold Orange
bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
bldwht=${txtbld}$(tput setaf 7) # Bold White

clear

        echo -e "${bldred}                                 "
        echo -e "${bldred}   ----------------------------- "
        echo -e "${bldred}   |    ${bldnormal}Installation of source code     ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   | ${bldnormal}Downloading the code ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |   ${bldnormal}Configuring the computer  ${bldred}| "
        echo -e "${bldred}   ----------------------------  "
	
  # Initial git config
	echo "Enter Github email: "
	read input_email
	echo "Enter your Github username(usually full name): "
	read input_user
	git config --global user.email "$input_email"
	git config --global user.name "$input_user"
clear

  # Source version selection
  echo "============================================================"
  echo " Choose your version....."
  echo "============================================================"
  echo 
  echo "  1 - Zircon"
  echo "  2 - Garnet"
  echo "  3 - Peridot"
  echo "  4 - Topaz"
  echo "  5 - Fuchsia (Full)
  echo
  echo -n "Enter an option: "
  read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      1) time curl -s "https://fuchsia.googlesource.com/fuchsia/+/master/scripts/bootstrap?format=TEXT" | base64 --decode | bash -s zircon;;
      2) time curl -s "https://fuchsia.googlesource.com/fuchsia/+/master/scripts/bootstrap?format=TEXT" | base64 --decode | bash -s garnet;;
      3) time curl -s "https://fuchsia.googlesource.com/fuchsia/+/master/scripts/bootstrap?format=TEXT" | base64 --decode | bash -s peridot;;
      4) time curl -s "https://fuchsia.googlesource.com/fuchsia/+/master/scripts/bootstrap?format=TEXT" | base64 --decode | bash -s topaz;;
      5) time curl -s "https://fuchsia.googlesource.com/fuchsia/+/master/scripts/bootstrap?format=TEXT" | base64 --decode | bash;;
      
    esac
  fi

  # Finaly Sinc repo of FuchsiaOS
	echo  
	echo -e "${bldcya}The code has been downloaded in 'pwd'/fuchsia"
	echo -e "${bldcya}You can compile in the locatio 'pwd'/fuchsia"
        echo -e "${bldorange}   -------------------------------------------------- "
        echo -e "${bldorange}   | ${txtund}Now you can access the following script | "
        echo -e "${bldorange}   |                                                  | "
        echo -e "${bldorange}   |         ${txtund}to compile FuchsiaOS.           | "
        echo -e "${bldorange}   |                                                  | "
        echo -e "${bldorange}   |     ${txtund}Happy Coding with FuchsiaOS!        | "
        echo -e "${bldorange}   -------------------------------------------------- "
exit
