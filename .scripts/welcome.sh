#!/bin/bash

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
DISTRO=$(cat /etc/os-release | grep "NAME" | head -n1 | sed 's/NAME="//g' | awk '{print $1}')

if [ $DISTRO == "Arch" ]; then
    LAST_UPGRADE=$(grep -a 'full system upgrade' /var/log/pacman.log | tail -n 1 | cut -d ' ' -f 1 | tr -d '[]')
    T1=$(date +%s -d $LAST_UPGRADE)
    T2=$(date +%s)
    DAYS_SINCE_UPGRADE=$(((T2 - T1) / 86400))

    UPGRADE_INDICATOR=""
    if [ $DAYS_SINCE_UPGRADE -gt 7 ]; then
        UPGRADE_INDICATOR="$RED[!]$RESET"
    elif [ $DAYS_SINCE_UPGRADE -gt 3 ]; then
        UPGRADE_INDICATOR="$ORANGE[!]$RESET"
    elif [ $DAYS_SINCE_UPGRADE -gt 0 ]; then
        UPGRADE_INDICATOR="$GREEN[!]$RESET"
    fi

    if [ $DAYS_SINCE_UPGRADE -gt 0 ]; then
        echo "$UPGRADE_INDICATOR $DAYS_SINCE_UPGRADE days since last system upgrade"
    fi
fi


# Only run outside of tmux after this point
if [ -n "$TMUX" ]; then
    exit
fi

if [ -n "$SESSIONS" ]; then
    echo -e "$GREEN[*]$RESET Tmux sessions: $GREEN$SESSIONS$RESET\n"
fi

