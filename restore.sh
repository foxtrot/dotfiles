#!/bin/bash

function check_uid() {
    if [ $EUID -eq 0 ]; then
        echo "[*] Running as root. Run as normal user instead."
        exit 1
    fi
}

function copy_files_any() {
    echo "[*] Copying dotfiles..."

    cp -r .config ~/
    cp -r .scripts ~/
    cp -r .git-templates ~/

    cp -r .gitconfig ~/
    cp -r .tmux.conf ~/
    cp -r .bashrc ~/
    cp -r .bash_aliases ~/
    cp -r .bash_profile ~/
}

function main() {
    check_uid
    copy_files_any
}

main
