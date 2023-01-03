#!/bin/bash

USERNAME=$1
HOSTNAME=$2
ARGC=$#

function check_uid() {
    if [ $EUID -ne 0 ]; then
        echo "[*] Run as root."
        exit 1
    fi
}

function check_args() {
    if [ $ARGC -lt 2 ]; then
        echo "[*] Invalid options, must be ./setup.sh username hostname"
        exit 1
    fi
}

function detect_os() {
    case "$(uname -s)" in
        Linux*)    MACHINE="Linux";;
        Darwin*)   MACHINE="Mac";;
        *)         MACHINE="unknown";;
    esac

    echo "[*] Running on ${MACHINE}"

    if [[ "$MACHINE" = "unknown" ]]; then
        exit 1
    fi

    if [[ "$MACHINE" = "Linux" ]]; then
        DISTRO=$(cat /etc/os-release | grep "^NAME=" | head -n1 | sed 's/NAME=//g' | sed 's/"//g' | awk '{print $1}')
    fi
}

function config_macos_system() {
    echo "[*] Configuring macOS system..."

    if [ -f "system-configs/macos/brew/casks" ] &&
       [ -f "system-configs/macos/brew/leaves" ] &&
       [ -f "system-configs/macos/brew/taps" ]; then
        echo "[*] Installing brew packages"

        while read -r line; do
            sudo -u $USERNAME brew tap $line
        done < system-configs/macos/brew/taps

        while read -r line; do
            sudo -u $USERNAME brew install $line
        done < system-configs/macos/brew/casks

        while read -r line; do
            sudo -u $USERNAME brew install $line
        done < system-configs/macos/brew/leaves
    fi

    echo "[*] Overlaying files..."
    if [ -d "system-configs/macos/files/" ]; then
        rsync -tr system-configs/macos/files/* /
    fi

    echo "[*] Running macOS setup scripts..."
    if [ -d "system-configs/macos/setup/" ]; then
        for script in system-configs/macos/setup/*.sh; do
            if [[ "$script" = "configure.sh" ]]; then
                bash "$script $HOSTNAME"
            else
                bash "$script"
            fi
        done
    fi
}

function config_arch_system() {
    echo "[*] Configuring Arch Linux system..."

    echo "[*] Overlaying files..."
    if [ -d "system-configs/arch/files/" ]; then
        rsync -tr system-configs/arch/files/* /
    fi
}

function config_ubuntu_system() {
    echo "[*] Configuring Ubuntu system..."

    echo "[*] Overlaying files..."
    if [ -d "system-configs/ubuntu/files/" ]; then
        rsync -tr system-configs/ubuntu/files/* /
    fi
}

function main() {
    check_uid
    check_args
    detect_os

    if [[ "$MACHINE" = "Mac" ]]; then
        config_macos_system
    elif [[ "$MACHINE" = "Linux" ]]; then
        if [[ "$DISTRO" = "Arch" ]]; then
            config_arch_system
        elif [[ "$DISTRO" = "Ubuntu" ]]; then
            config_ubuntu_system
        fi
    fi
}

main
