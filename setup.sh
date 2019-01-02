#!/bin/bash
if [[ $EUID -ne 0 ]]
then
  echo "pls run the script as root"
else
  echo "installing apache2 ......"
  sleep 0.5
  apt install apache2
  /etc/init.d/apache2 start
  rm /var/www/html/*
