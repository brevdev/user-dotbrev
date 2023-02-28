#!/bin/bash

set -eo pipefail

## install and configure oh-my-zsh headless for ubuntu 20.04
sudo apt update && sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended || true
# set default shell to zsh
sudo chsh -s /bin/zsh $USER

# add `"terminal.integrated.defaultProfile.linux": "zsh"` to .vscode-server/data/Machine/settings.json
python3 - <<EOF
import json
import os
def create_if_not_exists(path):
    if not os.path.exists(path):
        os.makedirs(path)

def create_file_if_not_exists(path):
    if not os.path.exists(path):
        open(path, 'a').close()

create_if_not_exists('.vscode-server')
create_if_not_exists('.vscode-server/data')
create_if_not_exists('.vscode-server/data/Machine')
create_file_if_not_exists('.vscode-server/data/Machine/settings.json')

with open('.vscode-server/data/Machine/settings.json', 'r') as f:
    try:
        data = json.load(f)
    except:
        data = {}
    data['terminal.integrated.defaultProfile.linux'] = 'zsh'
with open('.vscode-server/data/Machine/settings.json', 'w') as f:
    json.dump(data, f, indent=2)
EOF

## install and configure vim
sudo apt update && sudo apt install -y vim emacs

## set default editor to vim
sudo update-alternatives --set editor /usr/bin/vim.basic

## set git editor to vim
git config --global core.editor vim

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"
sudo apt-get update && sudo apt-get install -y git zip make build-essential

### docker ###
# https://docs.docker.com/engine/install/ubuntu/
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# https://docs.docker.com/engine/install/linux-postinstall/
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo usermod -aG docker $USER

# Legacy Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

##### Add Env Name to Terminal Prompt #####
# Define a function called getName
function getName {
  # Use jq to extract the "workspaceId" key from the "/etc/meta/workspace.json" file
  workspaceId=$(jq -r '.workspaceId' /etc/meta/workspace.json)

  # Use brev ls to list the dev environments and grep for the row that contains the workspace ID
  row=$(brev ls | grep "$workspaceId")

  # Extract the "NAME" column from the row using awk
  name=$(echo "$row" | awk '{print $1}')

  # Print the name
  echo "$name"
}

# Get the name using the getName function
name=$(getName)

# Replace the PROMPT line in robbyrussell.zsh-theme with a new prompt that includes the name
sed -i "s/^PROMPT=.*/PROMPT=\"%{\$fg_bold[cyan]%}$name %(?:%{\$fg_bold[green]%}➜ :%{\$fg_bold[red]%}➜ )\"/" ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
