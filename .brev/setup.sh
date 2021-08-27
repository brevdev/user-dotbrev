#!/bin/bash

####################################################################################
##### Install VSCode extensions, Linux tools or any other global tooling here. #####
##### This will be run everytime you create or join a new project.             #####
#####                                                                          #####
##### Note: execution of this file happens in the user-dotbrev folder          #####
####################################################################################

##### Essential Linux Installs #####
sudo apt-get install -y build-essential

##### Setting up VSCode defaults #####
mkdir -p /home/brev/.local/share/code-server/User
cp .vscode/settings.json /home/brev/.local/share/code-server/User/settings.json

##### Your VSCode Extensions #####
# code-server --install-extension <EXTENSION_ID>

##### Recommended VSCode Extensions #####
# code-server --install-extension esbenp.prettier-vscode
# code-server --install-extension eamodio.gitlens
# code-server --install-extension ms-azuretools.vscode-docker
# code-server --install-extension davidanson.vscode-markdownlint
# code-server --install-extension golang.go
# code-server --install-extension tyriar.sort-lines
# code-server --install-extension ryanolsonx.solarized

##### ZSH #####
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Copying your ZSH Settings
echo "" >>~/.zshrc
cat .zshrc >>~/.zshrc
mv ./.brev/utils ../.brev/
source ~/.zshrc

##### BASH #####
# Copying your BASH Settings
if [ ! -f "~/.bash_profile" ]; then
  touch ~/.bash_profile
fi
echo "" >>~/.bash_profile
cat .bash_profile >>~/.bash_profile
mv ./.brev/utils ../.brev/
echo "source ~/.bash_profile" >>~/.bashrc
source ~/.bash_profile

##### MAKE ZSH DEFAULT #####
# echo "" >>~/.bashrc
# echo "############################" >>~/.bashrc
# echo "##### MAKE ZSH DEFAULT #####" >>~/.bashrc
# echo "############################" >>~/.bashrc
# echo "" >>~/.bashrc
# echo "zsh" >>~/.bashrc
# source ~/.bashrc
