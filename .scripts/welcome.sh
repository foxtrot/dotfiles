#!/bin/bash

# Only run outside of tmux after this point
if [ -n "$TMUX" ]; then
    exit
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

if [ -n "$SESSIONS" ]; then
    echo -e "$GREEN[*]$RESET Tmux sessions: $GREEN$SESSIONS$RESET\n"
fi
