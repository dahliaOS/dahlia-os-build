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
        echo -e "${bldred}   |    ${bldnormal}Compilation of the code DahliaOS${bldred}|   "
        echo -e "${bldred}   |                                                            | "
        echo -e "${bldred}   |    ${bldnormal}Configuring Code...                ${bldred}| "
        echo -e "${bldred}   ---------------------------------------------------------------"
clear
        echo -e "${bldcya}  ---------------------------------------------------------------"
        echo -e "${bldcya}                Accessing the folder DahliaOS...                "
        echo -e "${bldcya}  ---------------------------------------------------------------"
cd fuchsia
tput setaf 2

# FuchsiaOS ARCH selection
  echo "============================================================"
  echo " Choose your Architecture....."
  echo "============================================================"
  echo 
  echo "  1 - x64"
  echo "  2 - x64 (Release)"
  echo "  3 - ARM64"
  echo "  4 - x64 workstation"
  echo
  echo -n "Enter an option: "
  read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      1) fx set core.64;;
      2) fx set core.x64 --release;;
      3) fx set core.arm64;;
      4) fx set workstation.x64
    esac
  fi
clear
# Build FuchsiaOS
echo -e "${bldgrn} --------------------------------------------------------------------------"
echo -e "${bldgrn}                         Compiling DahliaOS...                           "
echo -e "${bldgrn}       Please wait for Build Ninja to finish compiling the OS...          "
echo -e "${bldgrn} --------------------------------------------------------------------------"
time fx build

