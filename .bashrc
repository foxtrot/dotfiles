#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Stupid fucking vterms
cd ~

# Alias
alias ls='ls --color=auto'
alias l='ls'
alias grep='grep --color=auto'
alias ip='ip -c'
alias fuck="sudo !!"
alias castmiddle="vlc --no-video-deco --no-embedded-video --screen-fps=60 --screen-top=480 --screen-left=1080 --screen-width=3440 --screen-height=1440 screen://"
alias castleft="vlc --no-video-deco --no-embedded-video --screen-fps=60 --screen-top=0 --screen-left=0 --screen-width=1080 --screen-height=1920 screen://"
alias castright="vlc --no-video-deco --no-embedded-video --screen-fps=60 --screen-top=0 --screen-left=4520 --screen-width=1080 --screen-height=1920 screen://"
alias cb="xclip -selection clipboard"
alias cat="bat --pager=never"

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

#export PATH=$PATH:$(go env GOPATH)/bin
export EDITOR=vim

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google-cloud-sdk/completion.bash.inc'; fi

export PATH=$PATH:/home/$USER/.scripts/

