#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
source ~/.console/aliases.sh

# Colours
WHITE="\[$(tput setaf 255)\]"
BLACK="$(tput setaf 008)\]"
RED="\[$(tput setaf 001)\]"
GREEN="\[$(tput setaf 002)\]"
ORANGE="\[$(tput setaf 003)\]"
BLUE="\[$(tput setaf 004)\]"
PURPLE="\[$(tput setaf 005)\]"
TEAL="\[$(tput setaf 006)\]"
GREY="\[$(tput setaf 007)\]"
BRED="\[$(tput setab 009)\]"
BGREEN="\[$(tput setab 010)\]"
BORANGE="\[$(tput setab 011)\]"
BBLUE="\[$(tput setab 012)\]"
BPURPLE="\[$(tput setab 013)\]"
BTEAL="\[$(tput setab 014)\]"
BGREY="\[$(tput setab 238)\]"
RESET="\[$(tput sgr0)\]"

# Interaction Prompts
directory="$(pwd)"
basedirectory="$(basename $(pwd))"
if [ "$directory" = "/home/$USER" ]
then
    displaydirectory="~"
else
    displaydirectory=$basedirectory
fi

export PS1="$GREEN(\W) $RED>> $RESET"
export PS2="$ORANGE>$WHITE$RESET "
export PS3="$GREEN?$WHITE$RESET "
export PS4="$BLUE+$WHITE$RESET "

export PATH=$PATH:$(go env GOPATH)/bin
export EDITOR=vim

# GCloud
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google-cloud-sdk/completion.bash.inc'; fi

export PATH=$PATH:/home/$USER/.scripts/

bash ~/.scripts/welcome.sh
