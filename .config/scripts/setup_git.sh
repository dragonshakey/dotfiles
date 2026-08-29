#!/bin/bash

#generate ssh key
ssh-keygen -t ed25519 -C "dragonshakey@gmail.com"

#start ssh agent
eval "$(ssh-agent -s)"

#add private key to ssh agent
ssh-add $HOME/.ssh/id_ed25519

#set key type to ssh
git config --global gpg.format ssh

#add key, username and email to git config
git config --global user.signingkey $HOME/.ssh/id_ed25519.pub
git config --global user.name dragonshakey
git config --global user.email dragonshakey@gmail.com
