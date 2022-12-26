#!/bin/bash

# Ignore macOS for now...
if [[ "$(uname -s)" != "Linux"* ]]; then
    exit 0
fi

WHITE="$(tput setaf 255)"
BLACK="$(tput setaf 008)"
RED="$(tput setaf 001)"
GREEN="$(tput setaf 002)"
ORANGE="$(tput setaf 003)"
BLUE="$(tput setaf 004)"
PURPLE="$(tput setaf 005)"
TEAL="$(tput setaf 006)"
GREY="$(tput setaf 007)"
BRED="$(tput setab 009)"
BGREEN="$(tput setab 010)"
BORANGE="$(tput setab 011)"
BBLUE="$(tput setab 012)"
BPURPLE="$(tput setab 013)"
BTEAL="$(tput setab 014)"
BGREY="$(tput setab 238)"
RESET="$(tput sgr0)"

SESSIONS=$(tmux ls 2> /dev/null | awk '{print $1}' | sed 's/://' | sed -e ':a' -e 'N;$!ba' -e 's/\n/, /g')
DISTRO=$(cat /etc/os-release | grep "^NAME=" | head -n1 | sed 's/NAME=//g' | sed 's/"//g' | awk '{print $1}')
DAYS_SINCE_UPGRADE=0

if [ $DISTRO == "Arch" ]; then
    LAST_UPGRADE=$(grep -a 'full system upgrade' /var/log/pacman.log | tail -n 1 | cut -d ' ' -f 1 | tr -d '[]')
    T1=$(date +%s -d $LAST_UPGRADE)
    T2=$(date +%s)
    DAYS_SINCE_UPGRADE=$(((T2 - T1) / 86400))
elif [ $DISTRO == "Ubuntu" ]; then
    LAST_UPGRADE=$(stat --format="%X" /var/lib/apt/periodic/upgrade-stamp)
    CURRENT_TIME=$(date +%s)
    DAYS_SINCE_UPGRADE=$(((CURRENT_TIME - LAST_UPGRADE) / 86400))
fi

if [ $DAYS_SINCE_UPGRADE -gt 7 ]; then
    UPGRADE_INDICATOR=""
    if [ $DAYS_SINCE_UPGRADE -gt 28 ]; then
        UPGRADE_INDICATOR="$RED[!]$RESET"
    elif [ $DAYS_SINCE_UPGRADE -gt 14 ]; then
        UPGRADE_INDICATOR="$ORANGE[!]$RESET"
    elif [ $DAYS_SINCE_UPGRADE -gt 7 ]; then
        UPGRADE_INDICATOR="$GREEN[!]$RESET"
    fi

    echo "$UPGRADE_INDICATOR $DAYS_SINCE_UPGRADE days since last system upgrade"
fi

# Only run outside of tmux after this point
if [ -n "$TMUX" ]; then
    exit
fi

if [ -n "$SESSIONS" ]; then
    echo -e "$GREEN[*]$RESET Tmux sessions: $GREEN$SESSIONS$RESET\n"
fi

