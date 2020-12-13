#!/bin/bash

#We cannot remove all the packages, as this breaks encrypted booting.
#echo "remove all packages with tuxedo in their names..."
#
#sudo apt list --installed | grep tuxedo | tr '/' ' ' | awk '{ print $1 }' | xargs sudo apt -y purge

# This seems to be too much
#echo "removing tuxedo repositories"
#sudo rm /etc/apt/sources.list.d/*tuxedo*.list

# Testing: does replacing the repos work?

echo "using canonical repos"
sudo sed 's#mirrors.tuxedocomputers.com/ubuntu/mirror/##' -i /etc/apt/sources.list

echo "updating..."
sudo apt -y update

echo "running upgrade..."
sudo apt -y upgrade

echo "removing bloatware..."
for pkg in libreoffice rhythmbox pidgin libreoffice-common minetest shotwell libreoffice-base libreoffice-draw libreoffice-writer libreoffice-calc freeciv freeciv-client-gtk freeciv-data freeciv-server; do
	sudo apt -y remove $pkg
done

echo "removing unused packages"
sudo apt -y autoremove



