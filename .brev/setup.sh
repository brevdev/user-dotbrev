#!/bin/bash

set -eo pipefail

## install and configure oh-my-zsh headless for ubuntu 20.04
sudo apt update && sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# configure zsh as default shell without getting prompted for password
sudo usermod -s /bin/zsh $USER
