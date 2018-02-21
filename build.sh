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
        echo -e "${bldred}                                                                  "
        echo -e "${bldred}   ---------------------------------------------------------------"
        echo -e "${bldred}   |    ${bldnormal}Compilación del código de FuchsiaOS${bldred}| "
        echo -e "${bldred}   |                                                            | "
        echo -e "${bldred}   |    ${bldnormal}Configurando Código...             ${bldred}| "
        echo -e "${bldred}   ---------------------------------------------------------------"
clear
        echo -e "${bldcya}  ---------------------------------------------------------------"
        echo -e "${bldcya}                Accediendo a la carpeta FuchsiaOS...             "
        echo -e "${bldcya}  ---------------------------------------------------------------"
cd fuchsia
tput setaf 2

# FuchsiaOS ARCH selection
  echo "============================================================"
  echo " Elige tu Arquitectura....."
  echo "============================================================"
  echo 
  echo "  1 - x86-64"
  echo "  2 - x86-64 (Ultima Estable)"
  echo "  3 - ARM64"
  echo
  echo -n "Ingrese una opción: "
  read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      1) fx set x86-64;;
      2) fx set x86-64 --release;;
      3) fx set arm64;;
    esac
  fi
clear
# Build FuchsiaOS
echo -e "${bldgrn} --------------------------------------------------------------------------"
echo -e "${bldgrn}                         Compilando FuchsiaOS...                           "
echo -e "${bldgrn}       Por favor espere a que Build Ninja termine de compilar el OS...     "
echo -e "${bldgrn} --------------------------------------------------------------------------"
time fx full-build

