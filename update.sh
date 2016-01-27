#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "Este script ha de ser ejecutado como root" 1>&2
   exit 1
fi
apt-get update && apt-get upgrade -y
