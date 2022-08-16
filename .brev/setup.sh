#!/bin/bash

set -eo pipefail

## install and configure oh-my-zsh headless for ubuntu 20.04
sudo apt update && sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

## update /etc/passwd to have the user ubuntu's shell be zsh
sudo sed -i 's/\/bin\/bash/\/bin\/zsh/g' /etc/passwd

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
sudo apt update && sudo apt install -y vim

## set default editor to vim
sudo update-alternatives --set editor /usr/bin/vim.basic

## set git editor to vim
git config --global core.editor vim
