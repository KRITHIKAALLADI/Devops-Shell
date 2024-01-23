#!/bin/bash
#My First Shell Script using Variables
#Variable Declarations

URL=https://www.tooplate.com/zip-templates/2108_dashboard.zip
SRV=apache2
PCKG=apt
FILE=2108_dashboard

echo "Installing Packages"
sudo $PCKG install $SRV wget unzip -y
echo "Starting the apache2 server"
sudo systemctl start $SRV
echo "Downloading website template"
wget $URL
sleep 10
echo "unzip wesbite file"
unzip $FILE.zip
sleep 10
echo "Clearing Files in HTML Directory"
sudo rm -rf /var/www/html/*
echo "Copying unzip files to Html directory"
sudo cp -r $FILE/* /var/www/html/
sleep 10
echo "Restarting Apache2 server"
sudo systemctl restart $SRV
