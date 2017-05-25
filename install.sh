#!/bin/bash
if [[ $1 == "" ]]
then
  echo "Usage: ./install.sh wireless-interface
        Please Lookup your interface by running iwconfig"
else
  
  if [ "$EUID" -ne 0 ]
  then 
    echo "Please run as root"
    exit
  fi
  
  cDir=$(pwd)
  cd $(dirname $0)
  sed -i.orig "s/wlan0/$1/g" connectToVala
  cp connectToVala /usr/bin/connectToVala
  mv connectToVala.orig connectToVala
  chmod +x /usr/bin/connectToVala
  echo -e "Yay Success!\nYou can run the script by writing: connectToVala"
  cd $cdir
fi
