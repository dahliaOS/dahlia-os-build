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
        echo -e "${bldred}   |    ${bldnormal}Instalacion de codigo fuente     ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   | ${bldnormal}Descargando el codigo ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |   ${bldnormal}Configurando la computadora  ${bldred}| "
        echo -e "${bldred}   ----------------------------  "
	
  # Initial git config
	echo "Ingrese email de Github: "
	read input_email
	echo "Ingrese nombre de Github (Nombre cualquiera): "
	read input_user
	git config --global user.email "$input_email"
	git config --global user.name "$input_user"
clear

  # Source version selection
  echo "============================================================"
  echo " Elige tu versión....."
  echo "============================================================"
  echo 
  echo "  1 - Zircon"
  echo "  2 - Garnet"
  echo "  3 - Peridot"
  echo "  4 - Topaz"
  echo
  echo -n "Ingrese una opción: "
  read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      1) time curl -s "https://fuchsia.googlesource.com/scripts/+/master/bootstrap?format=TEXT" | base64 --decode | bash -s Zircon;;
      2) time curl -s "https://fuchsia.googlesource.com/scripts/+/master/bootstrap?format=TEXT" | base64 --decode | bash -s Garnet;;
      3) time curl -s "https://fuchsia.googlesource.com/scripts/+/master/bootstrap?format=TEXT" | base64 --decode | bash -s Peridot;;
      4) time curl -s "https://fuchsia.googlesource.com/scripts/+/master/bootstrap?format=TEXT" | base64 --decode | bash -s Topaz;;
      
    esac
  fi

  # Finaly Sinc repo of FuchsiaOS
	echo  
	echo -e "${bldcya}El codigo ha sido descargado en 'pwd'/fuchsia"
	echo -e "${bldcya}Tu podras compilar en la ubicacion 'pwd'/fuchsia"
        echo -e "${bldorange}   -------------------------------------------------- "
        echo -e "${bldorange}   | ${txtund}Ahora puedes acceder al siguiente script| "
        echo -e "${bldorange}   |                                                  | "
        echo -e "${bldorange}   |        ${txtund}para compilar FuchsiaOS.         | "
        echo -e "${bldorange}   |                                                  | "
        echo -e "${bldorange}   |       ${txtund}Happy Code with FuchsiaOS!        | "
        echo -e "${bldorange}   -------------------------------------------------- "
exit
