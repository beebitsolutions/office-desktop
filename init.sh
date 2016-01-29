#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "Este script ha de ser ejecutado como root" 1>&2
   exit 1
fi
apt-get update && apt-get upgrade -y
apt-get install git
cd ~
mkdir .maintenance
git clone https://github.com/beebitsolutions/office-desktop -b production ./.maintenance/
sh .maintenance/install.sh
