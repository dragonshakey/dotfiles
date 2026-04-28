#copy etc configs to /etc
sudo rm /etc/locale.conf
sudo cp $ETCCONFS/locale.conf /etc

#clone/download programs
mkdir GitRepos
mkdir Programs

cd $HOME/Programs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd $HOME
