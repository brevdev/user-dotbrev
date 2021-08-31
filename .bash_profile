##############################################################################################
##### Replace this file with your .bash_profile!                                         #####
##### If you don't have one, feel free to uncomment any of these recommended settings.   #####
#####                                                                                    #####
##### NOTE: if you are referencing any helper files, add them to .brev/utils and         #####
##### reference them with the absolute path                                              #####
##### /home/brev/workspace/user-dotbrev/.brev/utils/<FILENAME>.                          #####
##### See "Enable git autocomplete below" for an example.                                #####
##############################################################################################

# Load in the git branch prompt script.
source /home/brev/workspace/user-dotbrev/.brev/utils/git-prompt.sh

# git autocomplete
if [ -f /home/brev/workspace/user-dotbrev/.brev/utils/git-completion.bash ]; then
  . /home/brev/workspace/user-dotbrev/.brev/utils/git-completion.bash
fi

# modify prompt
export PS1="\e[33;1m\t \e[37mwetrill \e[0m| \e[36m\w\e[31m\$(__git_ps1)\e[37m\n| => "
