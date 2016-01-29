#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "Este script ha de ser ejecutado como root" 1>&2
   exit 1
fi
clear
echo "Instalando paquetes básicos de sistema"
apt-get update
apt-get install -y nano vim git nautilus-open-terminal filezilla libreoffice zip unrar imagemagick thunderbird default-jre
uwf enable
clear
echo "Instalando Chrome..."
cd ~
mkdir chrome-install
cd chrome-install
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} = 'x86_64' ]; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb chrome.deb
else
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb chrome.deb
fi
dkpg --install chrome.deb
clear
echo "Configuración de usuario \nPor favor, escriba el nombre del usuario:"
read nombre
adduser $nombre
apt-get autoremove
apt-get autoclean

