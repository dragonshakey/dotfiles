#!/bin/bash

#install pacman packages
sudo pacman -S `cat $HOME/packages.txt`

#copy etc configs to /etc
for file in "$ETCCONFS"/*
do
	sudo cp "$file" /etc
done

#making dirs
mkdir GitRepos
mkdir Programs
mkdir .config/zsh

#clone/download programs
#Install oh my zsh
cd $HOME/Programs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install yay and other aur packages
cd $HOME/GitRepos
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd
yay -S librewolf-bin

#clean up home
rm .bashrc .bash_logout .bash_profile .bash_history

#start services

#tlp for power management
sudo systemctl start tlp.service
sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

#start chrony
sudo systemctl start chronyd.service
sudo systemctl enable chronyd.service
