# Personal Settings for Brev.dev

Whenever you create or join a project, your user `.brev` directory runs, applying your personal user settings to each project. This includes terminal aliases, VSCode extensions, PS1 modifications etc.

Start by forking this repository, then follow the instructions below to modify this template to add your own custom user settings to Brev.dev. Remember to keep user specific settings here, for project specific settings see the [project `.brev` template repository](https://github.com/brevdev/default-project-dotbrev).

#### `.brev/setup.sh`
This is the main configuration file that runs on your linux machine, directly after we provision it and after your project is cloned.

You can install software like zsh, linux build tools, or create-react-app. Anything that you would globally install on your computer. Note the working directory when the file is running is `~/user-dotbrev`.

If you need help debugging your setup file, a log file is auto-created when this file runs. It is located at `./.brev/logs/setup.log`. We highly recommend echo-ing statements when installing new software to know where errors might be located.

#### `.brev/logs`
This is where we keep logs that occur when running the setup script and cloning repositories (such as this one, and your project repository if you are creating or joining a project from git).
