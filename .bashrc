#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Detect Platform
case "$(uname -s)" in
    Linux*)    machine=Linux;;
    Darwin*)   machine=Mac;;
esac

# Handle Platform
if [[ "$machine" = "Mac" ]]; then
    export SSH_AUTH_SOCK="/Users/marc/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"
fi

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

# Pathing
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH=$PATH:/home/$USER/.scripts/
if [[ "$(which go)" != "" ]]; then
    export PATH=$PATH:$(go env GOPATH)/bin
fi

# GCloud
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google-cloud-sdk/completion.bash.inc'; fi

# Misc
export HOMEBREW_NO_ANALYTICS=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export POWERSHELL_TELEMETRY_OPTOUT=1
eval $(/opt/homebrew/bin/brew shellenv)

if [ -f ~/.scripts/welcome.sh ]; then
    bash ~/.scripts/welcome.sh
fi
