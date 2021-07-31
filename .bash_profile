##############################################################################################
##### Replace this file with your .bash_profile!                                         #####
##### If you don't have one, feel free to uncomment any of these recommended settings.   #####
#####                                                                                    #####
##### NOTE: if you are referencing any helper files, add them to .brev/utils and         #####
##### reference them with the absolute path /home/brev/workspace/.brev/utils/<FILENAME>. #####
##### See "Enable git autocomplete below" for an example.                                #####
##############################################################################################

##### Bash #####
alias ll='ls -laghFG'
alias cd..='cd ..'

##### Git #####
alias push='git pull origin master && git push origin master'
alias pull='git pull origin master'
alias clone='git clone $1'
alias b="git branch"
alias s="git status"
alias a="git add ."
alias drop="git stash && git stash drop"
c() {
  git commit -m "$1"
}

##### Enable Git Autocomplete #####
if [ -f /home/brev/workspace/.brev/utils/git-completion.bash ]; then
  . /home/brev/workspace/.brev/utils/git-completion.bash
fi
source /home/brev/workspace/.brev/utils/git-prompt.sh
