# Brev Setup

Whenever you create or join a project, your user `.brev` directory runs, automating the setup of your project.

Fork and modify this template to add your own custom user settings. For project specific settings, see the [project `.brev` template repository](https://github.com/brevdev/default-project-dotbrev).

## Setup Steps

### 1. VSCode Settings
A. Replace `.vscode/settings.json` with your personal VSCode `settings.json`.
>To locate your personal VSCode `settings.json`, first open VSCode. Then click Cmd+Shft+P (Ctrl+Shft+P for Windows) and type `Preferences: Open Settings (JSON)`.

B. Open `.brev/setup.sh` and add your VSCode extensions.
>To find an extension id, click the settings icon on any extension card and click `Copy Extension ID`
><div style="text-align:center">
>  <img src="https://i.ibb.co/JkNsbkR/Screen-Shot-2021-08-01-at-6-36-57-PM.jpg" width="800" title="Example">
></div>

### 2. Terminal Settings

A. Replace `.zshrc` with your personal `.zshrc`. If you use bash, replace `.bash_profile` instead!
>Not sure if you have zsh? Type in `zsh --version` to check. To get your personal terminal settings, type in `cat ~/.zshrc` or `cat ~/.bash_profile`. If you have any files you want to reference in this script, add them to the `.brev/utils` folder and reference them as `/home/brev/workspace/.brev/utils/<FILENAME>`.

B. If you use bash, comment out the code under `##### MAKE ZSH DEFAULT #####` in `.brev/setup.sh`.
> Specifically lines 47 - 53.

If there are other tools you'd like to install *globally* (this means they are downloaded everytime you create or join a project), add them in `.brev/setup.sh`. For example, this is where we add zsh!

**Done! Happy coding!**

## Repository Contents

If you want to adjust these for more custom setups, here's more information on how this configuration repository is structured.

#### `.brev`
This is our main configuration folder. This is run everytime you create or join a new project. There is also a project specific dot brev with the same structure, which holds software that you can download for each project.

#### `.brev/setup.sh`
This is the main configuration file that runs on your linux machine, directly after we provision it and before your project is cloned.

You can pre-download VSCode extensions and globally install software like zsh, linux build tools, or create-react-app. Anything that you would globally install on your computer. Note the working directory when the file is running is `/home/brev/user-dotbrev`.

Careful not to place too many software packages in here (like Node v14, Python, or Go), and instead place that in your project's `.brev`. This way different versions of your software will not conflict, and others can clone your environment.

If you need help debugging your setup file, a log file is auto-created when this file runs. It is located at `/home/brev/user-dotbrev/.brev/logs/setup.log`. We highly recommend echo-ing statements into this file when installing new software to know where errors might be located.

#### `.brev/logs`
This is where we keep logs that occur when running the setup script and cloning repositories (such as this one, and your project repository if you are creating or joining a project from git).

#### `.brev/utils`
This is where we keep any other files that you'd like to include in your `.bash_profile` or your `.zshrc`. We port this folder to each workspace. References will always be `/home/brev/workspace/.brev/utils/<FILENAME>`. Ex. `git-completion.bash` runs if you use our recommended `.bash_profile` settings.

#### `.bash_profile` and `.zshrc`
This should be replaced with your bash profile or your zshrc. We use this to setup aliases, git completion or any other terminal specific settings you have for your terminal.
We have recommended aliases and git completion if you want to uncomment those lines. Again, any other files you'd like to reference should be in `/home/brev/workspace/user-dotbrev/.brev/utils/<FILENAME>`.

#### `.vscode/settings.json`
This file is copied into our fork of VSCode so your settings are the same.
