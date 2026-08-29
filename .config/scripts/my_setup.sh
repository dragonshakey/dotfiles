#! /bin/bash

#making dirs
mkdir GitRepos
mkdir Programs

#install pacman packages
sudo pacman -S `cat $HOME/.config/scripts/packages.txt`

chsh -s `which zsh`

#copy etc configs to /etc
for file in "$HOME/.config/etcconfs"/*; do
	if [[ -f $file ]]; then
		sudo cp "$file" /etc
	elif [[ -d $file ]]; then
		sudo cp -r "$file" /etc
	fi
done
sudo touch /etc/alsa/state-daemon.conf

sudo grub-mkconfig -o /boot/grub/grub.cfg

#clone/download programs
#Install oh my zsh
cd $HOME/Programs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install yay and other aur packages
cd $HOME/GitRepos
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si

#cd
#yay -S `cat $SCRIPTS/aur_packages.txt`

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

#start firewall
sudo systemctl start firewalld.service
sudo systemctl enable firewalld.service

#start ly
sudo systemctl enable ly@tty2.service
sudo systemctl disable getty@tty2.service

echo "reboot is required"
exit 0
