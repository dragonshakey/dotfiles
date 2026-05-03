#!/bin/bash

#install pacman packages
sudo pacman -S `cat $HOME/packages.txt`

#copy etc configs to /etc
sudo rm /etc/locale.conf
sudo cp $ETCCONFS/locale.conf /etc

#clone/download programs
mkdir GitRepos
mkdir Programs

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
