#!/bin/bash

####################################################################################
##### Install VSCode extensions, Linux tools or any other global tooling here. #####
##### This will be run everytime you create or join a new project.             #####
####################################################################################

##### Essential Linux Installs #####
sudo apt-get install -y build-essential

##### Setting up VSCode defaults #####
mkdir -p /home/brev/.local/share/code-server/User
cp .vscode/settings.json /home/brev/.local/share/code-server/User/settings.json

##### Your VSCode Extensions #####
code-server --install-extension vsls-contrib.codetour
code-server --install-extension ms-azuretools.vscode-docker
code-server --install-extension mikestead.dotenv
code-server --install-extension dbaeumer.vscode-eslint
code-server --install-extension golang.go
code-server --install-extension compulim.indent4to2
code-server --install-extension k--kato.intellij-idea-keybindings
code-server --install-extension davidanson.vscode-markdownlint
code-server --install-extension pkief.material-icon-theme
code-server --install-extension ms-vscode-remote.remote-containers
code-server --install-extension foxundermoon.shell-format
code-server --install-extension tyriar.sort-lines
code-server --install-extension xr0master.webstorm-intellij-darcula-theme

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
cat ../.zshrc >>~/.zshrc
source ~/.zshrc

##### BASH #####
# Copying your BASH Settings
if [ ! -f "~/.bash_profile" ]; then
  touch ~/.bash_profile
fi
echo "" >>~/.bash_profile
cat ../.bash_profile >>~/.bash_profile
source ~/.bash_profile

##### MAKE ZSH DEFAULT #####
echo "" >>~/.bashrc
echo "############################" >>~/.bashrc
echo "##### MAKE ZSH DEFAULT ##### " >>~/.bashrc
echo "############################" >>~/.bashrc
echo "" >>~/.bashrc
echo "zsh" >>~/.bashrc
source ~/.bashrc
